#!/bin/bash

NC='\033[0m'                    # No Color
Red='\033[0;31m'                # Red
Black='\033[0;30m'              # Black    
DarkGray='\033[1;30m'           # DarkGray   
LightRed='\033[1;31m'           # LightRed   
Green='\033[0;32m'              # Green      
LightGreen='\033[1;32m'         # LightGreen 
BrownOrange='\033[0;33m'        # BrownOrange
Yellow='\033[1;33m'             # Yellow     
Blue='\033[0;34m'               # Blue       
LightBlue='\033[1;34m'          # LightBlue  
Purple='\033[0;35m'             # Purple     
LightPurple='\033[1;35m'        # LightPurple
Cyan='\033[0;36m'               # Cyan       
LightCyan='\033[1;36m'          # LightCyan  
LightGray='\033[0;37m'          # LightGray  
White='\033[1;37m'              # White 


folders=(`ls`)

len=${#folders[*]}

i=0
while [ $i -lt $len ]; do
echo "$i: ${folders[$i]}"

F_NAME="${folders[$i]}"

if test -d "${F_NAME}"
then
echo -e "${Cyan}Stepping into: ${F_NAME}/"
    echo " "
    cd $F_NAME
    if [ -d ".git/" ]; then 
        echo -e "${LightGreen}Git repo found"
        BRANCH=$(git rev-parse --abbrev-ref HEAD)
        if [[ "$BRANCH" == "master" ]]; then
        echo -e "${LightGreen}The current branch is master${NC}"

        echo -e "${BrownOrange}Doing a git pull${NC}"
        git pull origin master
        echo -e "${LightGreen}Completed"
        echo " "
        fi
    elif [[ "$BRANCH" != "master" ]]; then
        echo -e "${LightPurple}Branch not master${NC}"
        echo " "
    fi
    cd ..
    echo -e "${Cyan}Left directory: ${F_NAME} ${NC}"
    echo " "

else                                   
echo -e "found ${F_NAME} doing nada..."
echo " "
fi

let i++
done
echo All repos in: $1 have been updated