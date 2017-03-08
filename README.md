
### Ways to create cookboks
- berks cookbook cookbook_name
- chef generate cookbook cookbooks/test

### How to work with Berkshelf
- [http://comtechies.com/how-to-manage-chef-cookbooks-with-berkshelf.html](http://comtechies.com/how-to-manage-chef-cookbooks-with-berkshelf.html)
- [https://docs.chef.io/berkshelf.html](https://docs.chef.io/berkshelf.html)


### Start chef client
- `knife configure client c:\\chef` to initialize defaults **or** `knife configure client -z C:\\chef`
- https://blog.chef.io/2013/10/31/chef-client-z-from-zero-to-chef-in-8-5-seconds/
- **`chef-client -z -o mybook`**

### Develop with client in local mode
The following configures chef-client to run a **`mybook`** cookbook in local mode

```
for /f %i in ('knife node list -z') do set THIS_NODE=%i
knife node run_list add -z %THIS_NODE% mybook
chef-client -z
```

