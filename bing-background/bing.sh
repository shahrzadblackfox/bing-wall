#!/bin/bash

bing="http://www.bing.com"

xmlURL="http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=en-WW"

savDir=$HOME'/Pictures/'
picOpts="zoom"
picRes="_1200x680"
picExt=".jpg"
name=$(date +"%Y-%m-%d")
picURL=$bing$(echo $(curl -s $xmlURL) | grep -oP "<urlBase>(.*)</urlBase>" | cut -d ">" -f 2 | cut -d "<" -f 1)$picRes$picExt
tempName=$name".jpg"

curl -s -o $saveDir$tempName $picURL



DISPLAY=:0 GSETTINGS_BACKEND=dconf gsettings set org.gnome.desktop.background picture-uri file://$deskDir$picFileName

DISPLAY=:0 GSETTINGS_BACKEND=dconf gsettings set org.gnome.desktop.background picture-options $picOpts


exit