#!/bin/bash

bing="http://www.bing.com"

xmlURL="http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=en-WW"

saveDir=$HOME'/Pictures/'
picOpts="zoom"
#made mistake here, always check for standard values.
picRes="_1280x720"
picExt=".jpg"
#be careful of the spaces. 
name=$(date +"%Y-%m-%d")
picURL=$bing$(echo $(curl -s $xmlURL) | grep -oP "<urlBase>(.*)</urlBase>" | cut -d ">" -f 2 | cut -d "<" -f 1)$picRes$picExt
tempName=$name".jpg"


curl -s -o $saveDir$tempName $picURL



DISPLAY=:0 GSETTINGS_BACKEND=dconf gsettings set org.gnome.desktop.background picture-uri file://$saveDir$tempName

DISPLAY=:0 GSETTINGS_BACKEND=dconf gsettings set org.gnome.desktop.background picture-options $picOpts
ln -s /Projects/ /bin/ 


exit
