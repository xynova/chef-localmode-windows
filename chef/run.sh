#! /bash

echo 

echo '*********************'
echo '* VENDOR COOKBOOKS'
echo '*********************'

pushd cookbooks/mybook 
rm -Rf  ../vendored/cookbooks/mybook 
berks vendor ../vendored/cookbooks 
rm -Rf ../vendored/cookbooks/mybook
popd

echo


echo
echo '*********************'
echo '* FOODCRITIC MYBOOK'
echo '*********************'

foodcritic cookbooks/mybook

#:: runs a cookbok in solo mode in the current path

echo
echo '*********************'
echo '* RUN CLIENT'
echo '*********************'


chef-client --local-mode --minimal-ohai --config client.rb "$@"