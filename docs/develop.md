
# Develop with ChefZero


## Prerequisites 

1. Open a `cmder` session
2. Install <a href="https://chocolatey.org/packages/chefdk" target="_blank">chefdk</a> chocolatey package : Chef development kit

```
$ choco install chefdk -y
```


## Setting up Chef `knife` to work locally with ChefZero

Knife is an essential tool in the chef workflow. However it requires some configuration to be able to use it for local development against a ChefZero server.

Positioned at the Repo root, `cd` into the `chef` directory and then execute the `knife-init.bat` command.

```
$ cd chef
$ knife-init
```


## Running the Chef Cookbook locally with ChefZero 
Positioned at the Repo root, `cd` into the `chef` directory and then execute the `run.bat` command. This will run the `cookbooks/mybook` default recipe.

```
$ cd chef
$ run
```

If you want to run a specific recipe append the -o flag to the run command as follows:

```
$ run -o mybook::specific_recipe
```

#### Debugging
To run in debug mode append the options `-l debug` to the command.  We can use `tee` to redirect the STDOUT to a log file.
```
$ run -l debug | tee logs.ignore.txt
```


## Other topics



#### Ways to create cookbooks
- `berks cookbook cookbooks/mynewbook`: gives a complete folder structure
- `chef generate cookbook cookbooks/mynewbook`: adds kitchen, tests and other folders

#### How to work with Berkshelf
- [http://comtechies.com/how-to-manage-chef-cookbooks-with-berkshelf.html](http://comtechies.com/how-to-manage-chef-cookbooks-with-berkshelf.html)
- [https://docs.chef.io/berkshelf.html](https://docs.chef.io/berkshelf.html)




