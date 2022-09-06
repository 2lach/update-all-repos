<p align="center">
	<h2>Keep all your local repos and workspaces synced with one command</h2>
	<br>
	<br>
</p>

> Automate the chore of keeping your workspace up to date.

## Highlights

- Update all repositories in your workspace/s

## Install

For this script to work, you need to have `bash`, `git` and a terminal of your choice installed.

## API

None, but the script itself is highly hackable and i've included a bunch of bash prompt colors for easy customizing.

### Installation

```sh
# Clone repo
git clone https://github.com/2lach/update-all-repos.git  
````

```sh
# go into the folder
cd update-all-repos; 

# and add this script to your path
# it can be done with:

cp get-all-updates.sh ~/

# add it to your bashrc
printf '# Update all repositories in your workspace(s) \n
git-update-all(){
bash ~/get-all-updates.sh $PWD
}' >> ./.bashrc
```

You can also add it to your bin folder (requires sudo)

```sh
sudo chmod +x get-all-updates.sh;
cp get-all-updates.sh ~/usr/local/bin/get-all-updates
```

Now you can update all your repositories, in all your workspaces by running:
`get-all-updates` so you never again have to enter them one-by-one and update them like a savage ;).

- The script  is tested and works works with bash, zsh, ksh and pretty much any shell.

#### The logic step by step

1) first the script checks if there is a .git folder.
2) If there is a .git folder, it will check if the the current branch is `master/main or develop`.
3) If these are true meaning both git repo exists and the branch is master, main or develop the script will run `git fetch` and `git pull`
4) After the pull is done, it will exit the folder and repeat the process on the next folder in your current path.

- If any of the steps 1-3 is `false` it will exit the the folder and continue with the next.

#### Extension, check for commited secrets
A secrets check which includes a scan after git update of repository is completed
The scan is run with the free and opensource tool [gitleaks](https://github.com/zricethezav/gitleaks)

Essentially if gitleaks is installed a 4:th step is included after step 3) when the script will run `git fetch` and `git pull`

4)
If gitleaks is installed, a file will be created in the repository with the name ´gitleaks_report_foldername_branch.txt` containing the results if any secrets or sensitive infomation is present in the repository.
5) After the scan is done, the script will exit the folder and repeat the process on the next folder in your current path.

if gitleaks is not installed it will do as before e.g update repositories and move on to the next, that's it.


| Demo |
| ----------- |
|[get-all-updates](https://github.com/2lach/get-all-updates) ![gitleaks-demo-fast-cropped](./demo.gif)|

## Maintainers

- [Stefan Lachmann](https://github.com/2lach)

## License

MIT
