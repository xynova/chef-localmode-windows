#! /bash

echo
echo '*********************'
echo '* RUN CLIENT'
echo '*********************'


chef-client --local-mode --config client.rb -o mybook "$@"