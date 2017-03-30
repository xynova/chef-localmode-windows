#! /bash
set -u
set -e 

HOMEDIR="${1//\\//}/.chef"
SCRIPTDIR="${2//\\//}"

KNIFE_FILE="$HOMEDIR/knife.rb"

mkdir -p $HOMEDIR
#echo $HOMEDIR
#exit 0

echo 
if [ -f "$KNIFE_FILE" ]; then
    echo '*********************'
    echo '* BACKUP EXISTING knife.rb'
    echo '*********************'
    BKUP="$HOMEDIR/knife.$(date +%Y-%m-%d-%M%S).rb"
    cp $KNIFE_FILE $BKUP
    readlink -f $BKUP
    echo
fi


echo '*********************'
echo '* CREATE NEW knife.rb POINTING TO CURRENT REPO'
echo '*********************'

cat <<-EOF | tee $KNIFE_FILE
    log_level :info
    log_location STDOUT
    chef_server_url 'chefzero://localhost:8889'
    syntax_check_cache_path '~/.chef/syntax_check_cache'

    chef_zero.enabled true
    chef_zero[:port] = 8889
    validation_key '/nonexist'
    knife[:editor] = 'notepad'

    cookbook_path "${SCRIPTDIR}cookbooks/"
EOF

echo
readlink -f $KNIFE_FILE

