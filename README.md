
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



### Ways to create cookbooks
- `berks cookbook cookbooks/mynewbook`: gives a complete folder structure
- `chef generate cookbook cookbooks/mynewbook`: adds kitchen, tests and other folders

### How to work with Berkshelf
- [http://comtechies.com/how-to-manage-chef-cookbooks-with-berkshelf.html](http://comtechies.com/how-to-manage-chef-cookbooks-with-berkshelf.html)
- [https://docs.chef.io/berkshelf.html](https://docs.chef.io/berkshelf.html)


### Configure chef client in local mode in a custom directory
- First configure chef local client in the C drive:
```
$ knife configure client -z C:/chef
```

- Vendor cookbooks into the  
```
$ pushd cookbooks\\mybook && berks vendor c:/chef/cookbooks && popd
```

- Go to the `c:/chef/` directory and, initialize the node config and then set the current run_list for the node
```
$ chef-client --local-mode --minimal-ohai
$ for /f %i in ('knife node list --local-mode') do set THIS_NODE=%i
$ knife node run_list add --local-mode %THIS_NODE% mybook
```

- Then just run the client
```
$ chef-client -z
```




