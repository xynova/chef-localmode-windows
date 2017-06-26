#! /bash

echo 

if where -q berks; then
	echo '*********************'
	echo '* VENDOR COOKBOOKS'
	echo '*********************'

	pushd cookbooks/mybook 
	rm -Rf  ../vendored/cookbooks/mybook 
	berks vendor ../vendored/cookbooks 
	rm -Rf ../vendored/cookbooks/mybook
	popd

	echo
fi


if where -q foodcritic; then
	echo
	echo '*********************'
	echo '* FOODCRITIC MYBOOK'
	echo '*********************'

	foodcritic cookbooks/mybook
fi

#:: runs a cookbok in solo mode in the current path

echo
echo '*********************'
echo '* RUN CLIENT'
echo '*********************'

rm -Rf local_mode_cache
chef-client --local-mode --minimal-ohai --config client.rb "$@"
