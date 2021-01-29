#!/bin/bash
# I am a simple shell script that downloads all repositories from a user and then hunts them for sh1t.
#echo "I need gitleaks, install and configure it: https://github.com/zricethezav/gitleaks"
echo ""
echo "  .,-:::::/  ::::::::::::::: .::::::.   ::   .:  :.::::::::::::
,;;-''''''   ;;;;;;;;;;;'''';;;'    '  ,;;   ;;, ;;;;;;;;;;''''
[[[   [[[[[[/[[[     [[     '[==/[[[[,,[[[,,,[[[ [[     [[     
'SSc.    'SS SSS     SS       '''    $'SS$''SS$ SS     SS     
 'Y8bo,,,o88o888     88,     88b    dP 888   '88o88     88,    
   ''YMUP'YMMMMM     MMM      'YMmMY'  MMM    YMMMM     MMM "
echo "░░░░░░░░░░░░░░░░░░░░▒▓█[GitSh1t]█▓▒░░░░░░░░░░░░░░░░░░░░░░░░"
echo " 
                Feed me a github username 
                & I will moove it moove it
                and bring you some sh1t 
                        \   ^__^
                         \  (oo)\_______
                            (__)\       )\/
                                ||---23 |
                                ||     || "
echo ""
read -p 'Enter GitHub Username:  ' gituser 
mkdir $gituser
cd $gituser
curl -s https://api.github.com/users/$gituser/repos | grep \"clone_url\" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1 git clone
#echo "I need gitleaks, install and configure it: https://github.com/zricethezav/gitleaks"
mkdir sh1t
cd sh1t
for r in */ ; do
    gitleaks --repo-path=. -v --pretty > $r.json && git push --verbose --pretty
done
echo "Go check the sh1t out that I found in $gituser/sh1t/$r" 
 