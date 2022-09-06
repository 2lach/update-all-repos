#!/bin/bash

# Not used colors
# Red='\033[0;31m'         # Red
# Black='\033[0;30m'       # Black
# DarkGray='\033[1;30m'    # DarkGray
# LightRed='\033[1;31m'    # LightRed
# Green='\033[0;32m'       # Green


# Blue='\033[0;34m'        # Blue
# LightGray='\033[0;37m'   # LightGray
# Purple='\033[0;35m'      # Purple

NC='\033[0m'             # No Color
LightBlue='\033[1;34m'   # LightBlue
White='\033[1;37m'       # White
LightGreen='\033[1;32m'  # LightGreen
BrownOrange='\033[0;33m' # BrownOrange
LightPurple='\033[1;35m' # LightPurple
Cyan='\033[0;36m'        # Cyan
LightCyan='\033[1;36m'   # LightCyan
Yellow='\033[1;33m'      # Yellow

# Verify that git is installed otherwise exit
command -v git >/dev/null 2>&1 ||
	{
		echo >&2 "Git is not installed.	Aborting."
		exit 1
	}

# check if gitleaks is installed
if command -v gitleaks;
then
	GITLEAKS_INSTALLED="true"
else
 		echo >&2 "gitleaks is not installed."
		echo "You can get it here -> https://github.com/zricethezav/gitleaks#getting-started"
		GITLEAKS_INSTALLED="false"
fi

function run_gitleaks(){
	if [ $GITLEAKS_INSTALLED ] 
	then 
	gitleaks detect -v > gitleaks_report_"$1"_"$2".txt
	fi

}

# get folders in current directory
folders=($(ls))

# number of folders in current directory
len=${#folders[*]}

# iteration number
i=0

while [ $i -lt "$len" ]; do
	# echo current folder
	# echo "$i: ${folders[$i]}"

	F_NAME="${folders[$i]}"

	# Verify existence of folder
	if test -d "${F_NAME}"; then

		echo -e "${Cyan}Stepping into: ${F_NAME} ${NC}"

		cd "$F_NAME" || exit

		if [ -d ".git/" ]; then
			printf "\n----------------------------------------------------------------\n\n"
			echo -e "${LightGreen}Git repo found${NC}"
			BRANCH=$(git rev-parse --abbrev-ref HEAD)

			if [[ "$BRANCH" == "master" ]] || [[ "$BRANCH" == "main" ]] || [[ "$BRANCH" == "develop" ]]; then
				echo -e "${LightCyan}The current branch is: ${White}${BRANCH} ${NC}"
				echo -e "${LightBlue}Doing git fetch and pull${NC}"

				git fetch
				git pull
				# run a secrets-scan with gitleaks (if intstalled) 
				[ $GITLEAKS_INSTALLED ]  && run_gitleaks "$F_NAME" "$BRANCH"

				echo -e "${LightGreen}Completed ${NC}"

				printf "\n----------------------------------------------------------------\n\n"
			fi

		elif [[ "$BRANCH" != "master" ]] || [[ "$BRANCH" != "main" ]] || [[ "$BRANCH" != "develop" ]]; then
				echo -e "${LightPurple}Branch not master/main/develop, current branch is: ${White} ${BRANCH} ${NC}" 
			printf "\n----------------------------------------------------------------\n\n"
		fi

		cd ..

		echo -e "${Yellow}Left directory: ${White}${F_NAME} ${NC}"
		printf "\n----------------------------------------------------------------\n\n"

	else
		echo -e "Did not find a git repo in ${F_NAME} doing nada..."
		echo " "
	fi

	let i++
done
echo "All repos in"
echo -e "${BrownOrange} $1 || $PWD ${NC}"
echo "have been updated"
