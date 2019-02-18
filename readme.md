# Get all your repos up to date

> Automate the chore of keeping your workspace up to date.

## Highlights

- Update all the repos in your workspace

## Install

For this script to work, you need to have bash and git installed

(Only tested on mac)

## API

none, run as is from workspace root

### How it works

Place the script named get-all-updates.sh in the workspace root.
run it.

It will save all folders in its current path, enter the folders one.
first check is there a .git folder.
If it it, it will check is the current branch master.
If that also is true, it will do a git pull origin master.
then exit the folder and do the same in the next folder.

### Overview

<!-- markdownlint-disable -->
```Zsh
workspace root
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
