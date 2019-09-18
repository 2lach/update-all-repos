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

none

#### How it works

clone repo or copy the bash script `get-all-updates.sh` and place it in your ~/

then add:
```BASH
# get all updates git script
get-all-updates(){
	bash ~/get-all-updates.sh $PWD
}
```
to your .bashrc or .zshrc or whatever rc file you use. 

The script will then update all projects (that are on the branch master) in your current path by doing a `git pull`

step by step:
1) first the script checks if there is a .git folder.
2) If there is a .git folder, it will check if the the current branch is `master`.
3) If there is a .git folder and the branch is master, the script will do a pull
4) After the pull is done, it will exit the folder and repeat the process on the next folder in your current path.

* And ofcourse if any of the steps 1-3 is false it will exit the folder.

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





## Maintainers

- [Stefan Lachmann](https://github.com/2lach)


## License

MIT
