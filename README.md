
### Ways to create cookboks
- berks cookbook cookbook_name
- chef generate cookbook cookbooks/test

### How to work with Berkshelf
- [http://comtechies.com/how-to-manage-chef-cookbooks-with-berkshelf.html](http://comtechies.com/how-to-manage-chef-cookbooks-with-berkshelf.html)
- [https://docs.chef.io/berkshelf.html](https://docs.chef.io/berkshelf.html)


### Configure chef client in local mode
- First configure chef local client in the C drive `knife configure client -z C:\\chef`
- berks vendor c:\chef\cookbooks
- Go to the C drive
- Execute the following
```
for /f %i in ('knife node list -z') do set THIS_NODE=%i
knife node run_list add -z %THIS_NODE% mybook
chef-client -z
```



- https://blog.chef.io/2013/10/31/chef-client-z-from-zero-to-chef-in-8-5-seconds/
- **`chef-client -z -o mybook`**

### Develop with client in local mode
The following configures chef-client to run a **`mybook`** cookbook in local mode


