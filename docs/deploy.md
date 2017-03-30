
# Deploying Repo with ChefZero



## Prerequisites 

1. Open a `cmder` session
2. Install <a href="https://chocolatey.org/packages/chef-client" target="_blank">chef-client</a> chocolatey package: Chef Client 

```
$ choco install chef-client -y
```

# Install knife winrm gem if not present

1. Install the `knife` winrm gem to  enable knife to execute commands on remote nodes via winrm protocol.

```
$ C:\opscode\chef\embedded\bin\ruby gem install knife-windows
```



### Running the Chef Cookbook

In your `cmder` session, `cd` into the `chef` directory and then execute the `run-client.bat` command

```
$ cd chef
$ run-client
```

#### Debugging
To run in debug mode append the options `-l debug` to the command.  We can use `tee` to redirect the STDOUT to a log file.
```
$ run-client -l debug | tee logs.ignore.txt
```

