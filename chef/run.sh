#! /bash

echo 

echo '*********************'
echo '* VENDOR COOKBOOKS'
echo '*********************'


pushd cookbooks/mybook && berks vendor ../vendored/cookbooks && popd
echo

#:: runs a cookbok in solo mode in the current path

echo
echo '*********************'
echo '* RUN CLIENT'
echo '*********************'


chef-client --local-mode --config client.rb -o mybook "$@"