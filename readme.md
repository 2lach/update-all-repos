<p align="center">
	<h2>Keep all your git repos up to date with one command</h2>
	<br>
	<br>
</p>

> Automate the chore of keeping your workspace up to date.

## Highlights

- Update all the repos in your workspace/s


## Install

```
For this script to work, you need to have bash, git and the terminal of your choice installed
```


## API

none, but the script itself is highly hackable and i've included a bunch of bash prompt colors for easy customizing.

#### How it works

clone repo
`git clone https://github.com/2lach/update-all-repos.git`  
enter repo and cp script to ~/  
`cd update-all-repos; cp get-all-updates.sh ~/`  
then:

```BASH
echo '# get all updates git script
git-update-all(){
	bash ~/get-all-updates.sh $PWD
}' >> ./.bashrc
```

then you can update all your repos, in all your workspaces but running:
`get-all-updates` so you never again got to enter them all and update them one by one.

* The script works with bash, zsh, ksh and pretty much any shell as long as it understand basic bash. 

The script will update all projects (if it's on the master branch) in your current path.


##### The logic step by step:
1) first the script checks if there is a .git folder.
2) If there is a .git folder, it will check if the the current branch is `master`.
3) If there is a .git folder and the branch is master, the script will do a pull
4) After the pull is done, it will exit the folder and repeat the process on the next folder in your current path.

* And if any of the steps 1-3 is `false` it will exit the repo.

### Overview:

```Zsh
your current path
├── Project
|	|── .git/
│   ├── README.md
│   ├── node_modules
│   ├── package.json
		- Here it will check if the current branch is master
		- if master is true do git pull
		- Exit folder
├── Project
|	|── .git/
│   ├── README.md
│   ├── node_modules
│   ├── package.json
├── Images
|	|── something.jpg
│   ├── moving.gif
│   ├── vector.svg
│   ├── pow.txt
		- No .git folder found
		- Exit folder
```
Screenshot:
![terminalshot of get all updates in action](https://raw.githubusercontent.com/2lach/update-all-repos/master/update-all-repos-screenshot.png)




## Maintainers

- [Stefan Lachmann](https://github.com/2lach)


## License

MIT
