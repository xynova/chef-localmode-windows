#! /bash

set -e
set -u

# About variable values: you can use most characters as variable values, 
# including white space. If you use the special characters <, >, |, &, or ^, 
# you must precede them with the escape character (^) 

# REMEMBER TO RUN chef/KNIFE_INIT.bat

NODES=$1
WIN_USERNAME=$WIN_USERNAME
WIN_PASSWORD=$WIN_PASSWORD
CHEF_ENVIRONMENT=$CHEF_ENVIRONMENT


boostrap_node(){
	local node=$1
	local username=$2
	local password=$3
	local environment=$4

    # Install choco
    knife winrm "$node" \
    "where -q choco && echo 'choco already installed' || powershell iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" \
    --winrm-user "$username" --winrm-password "$password" --manual-list

    # Install cmder
    knife winrm "$node" 'where -q cmder && echo "cmder already installed" || choco install cmder -y'  --winrm-user "$username" --winrm-password "$password" --manual-list

    # Install chef-client
    knife winrm "$node" 'where -q chef-client && echo "chef-client already installed" || choco install chef-client -y' --winrm-user "$username" --winrm-password "$password" --manual-list


    # Run client on node
#    knife winrm "$node" 'cd c:/chef/repo && run-client' -m --winrm-user "$username" --winrm-password "$password" --manual-list

	knife winrm "$node" "cd c:/chef/repo && chef-client --local-mode --config client.rb -o mybook -E $environment" --winrm-user "$username" --winrm-password "$password" --manual-list
}


transfer_files_to_node(){
	local node=$1
	local error=0
	
	# https://ss64.com/nt/robocopy.html
	# https://gist.github.com/syl20bnr/4269229

	# Copy secrets
	robocopy -nfl -ndl -nc -ns -np c:/chef/ "\\\\${node}/c$/chef/" *.txt || error=$?
    	[ "$error" -gt 7 ] && exit 1

	# Copy repo
	robocopy -s -purge -nfl -ndl -nc -ns -np ../chef "\\\\${node}/c$/chef/repo" || error=$?
    	[ "$error" -gt 7 ] && exit 1
	
	echo "Code: $error"
}


#pushd ../chef/cookbooks/mybook 
#rm -Rf  ../vendored/cookbooks/mybook 
#berks vendor ../vendored/cookbooks 
#popd

IFS=', ' read -r -a HOSTS <<< "$NODES"
for i in "${HOSTS[@]}"; do
	transfer_files_to_node "$i"
	boostrap_node "$i" "$WIN_USERNAME" "$WIN_PASSWORD" "$CHEF_ENVIRONMENT"
done



