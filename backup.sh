#!/bin/bash

start=`date +%s`

folders=('Projects'
		 'Lectures'
		 'Archives'
		 'Desktop'
		 'Music'  
	     'Pictures'
	     'Documents'  
	     'Code' 
	     'Templates' 
	     'Downloads'
	     'Dropbox' 
	     'Videos' 
	     '.themes' 
	     '.mujoco'  
	     '.tmux-themepack' 
	     '.tmux' 
	     '.vim' 
	     '.oh-my-zsh'
	     )

for item in ${folders[*]}
do
    rsync -azlPK --exclude='node_modules/' "/home/ujjwal/$item" "/media/ujjwal/Elements/Newton"
done

# sleep 10;
end=`date +%s`
# secs=$((end-start))

echo $((end-start)) | awk '{printf "It took %d:%02d:%02d hours", $1/3600, ($1/60)%60, $1%60}'