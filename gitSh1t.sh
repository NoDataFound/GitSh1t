#!/bin/bash
# I am a simple shell script that downloads all repositories from a user and then hunts them for sh1t.
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
file="/Users/0xdeadbeef/git.txt"
n=1
n=$((n+1))
mkdir "loot"
cd loot
while read line; do
    gituser=$(echo $line)
    gituser=$line
    mkdir $gituser
    cd $gituser/
    curl -s "https://api.github.com/users/$gituser/repos?per_page=1000" | grep \"clone_url\" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1 git clone
    cd ..
done < $file
echo "Line No. $n : $line"
for r in `find . -path ./git -prune -o -type d -mindepth 1 -maxdepth 1` ; do
    `gitleaks detect --source "$r" -v -l debug -r thisreportissh1t.json -f json > $r/sh1t.json`
done
find . -name 'sh1t.json' -exec cat {} \;
echo "Go check out how full of 💩 all the 💩 I found in $gituser/"
