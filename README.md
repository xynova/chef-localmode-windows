
# Run **Chef Cookbook** standalone on Windows


## Running on **DEV** machine

### Prerequisites 
- Install <a href="https://chocolatey.org/" target="_blank">chocolatey package manager</a>.
- Install the following chocolatey packages:
    - <a href="https://chocolatey.org/packages/Cmder" target="_blank">choco install cmder</a>: git,bash and cool commandline
    - <a href="https://chocolatey.org/packages/chefdk" target="_blank">choco install chefdk</a>: Chef development kit

### Running the Chef Cookbook for Dev 
`cd` into the `chef` directory and then execute the `run.bat` command

```
$ cd chef
$ run
```

To run in debug mode append the options `-l debug` to the command. We can use `tee` to redirect the STDOUT to a log file.
```
$ run -l debug | tee logs.ignore.txt
```



## Running on **PROD** machine

### Prerequisites 
- Install <a href="https://chocolatey.org/" target="_blank">chocolatey package manager</a>.
- Install the following chocolatey packages:
    - <a href="https://chocolatey.org/packages/Cmder" target="_blank">choco install cmder</a>: git,bash and cool commandline
    - <a href="https://chocolatey.org/packages/chef-client" target="_blank">choco install chef-client</a>: Chef Client 

### Running the Chef Cookbook for Prod 
`cd` into the `chef` directory and then execute the `run-client.bat` command

```
$ cd chef
$ run-client
```

To run in debug mode append the options `-l debug` to the command.  We can use `tee` to redirect the STDOUT to a log file.
```
$ run-client -l debug | tee logs.ignore.txt
```

# Other topics



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


