#!/usr/bin/env bash
# Author : Thibault MILLANT
# Script to update the chmod on the log directory
# Can be used with crontab to update automatically

#chmod o+rx -R /var/log/*

# We move to the log directory
cd /var/log

# We change the Internal Field Separator (IFS)
# Space by default
old_IFS=$IFS
IFS=$'\n'

# We list directories and files in the current directory
for file in `ls -l`; do
	# Get each line
	echo "File found : $file"
	# Get the first character to identify the type of file
	first_letter=${file:0:1}
	echo "First letter : $first_letter"
	# Get the last word in the sting (File's name)
	last_word=${file##* }
	echo "Last word : $last_word"

	case $first_letter in
		"-" | "l")
			echo "This is a file or a link."
			
			;;
		"d")
			echo "This is a directory."
			#chmod o+rx $file
			;;
		*)
			echo "Other."
			;;
	esac
done

# Set up the default IFS
ISF=$old_IFS

exit 0
