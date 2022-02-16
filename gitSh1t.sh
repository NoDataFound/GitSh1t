#!/bin/bash
# I am a simple shell script that downloads all repositories from a user and then hunts them for sh1t.
#echo "I need gitleaks, install and configure it: https://github.com/zricethezav/gitleaks"
#brew install gitleaks
echo ""
echo "  .,-:::::/  ::::::::::::::: .::::::.   ::   .:  :.::::::::::::
,;;-''''''   ;;;;;;;;;;;'''';;;'    '  ,;;   ;;, ;;;;;;;;;;''''
[[[   [[[[[[/[[[     [[     '[==/[[[[,,[[[,,,[[[ [[     [[
'SSc.    'SS SSS     SS       '''    $'SS$''SS$ SS     SS
 'Y8bo,,,o88o888     88,     88b    dP 888   '88o88     88,
   ''YMUP'YMMMMM     MMM      'YMmMY'  MMM    YMMMM     MMM "
echo "░░░░░░░░░░░░░░░░░░░░▒▓█[Git💩]█▓▒░░░░░░░░░░░░░░░░░░░░░░░░"
echo "
                Feed me a github username
                & I will moove it moove it
                and bring you some sh1t
                        \   ^__^
                         \  (oo)\_______
                            (__)\       )\/
                                ||---23 | 💩
                                ||     || "
echo ""
read -p 'Enter the gitHub username to git their 💩:  ' gituser
mkdir $gituser
cd $gituser/
curl -s https://api.github.com/users/$gituser/repos | grep \"clone_url\" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1 git clone
#echo "I need gitleaks, install and configure it: https://github.com/zricethezav/gitleaks"
for r in `find . -path ./git -prune -o -type d -mindepth 1 -maxdepth 1` ; do
    `gitleaks detect --source "$r" -v -l debug -r thisreportissh1t.json -f json > $r/sh1t.json`
done
find . -name 'sh1t.json' -exec cat {} \;
echo "Go check out how full of 💩 all the 💩 I found in $gituser/"
