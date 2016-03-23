#!/usr/bin/env bash
## Author : Thibault MILLANT
## Script to update the chmod on the log directory
## Can be used with crontab to update automatically

## Fonction
# We list directories and files in the current directory
Browse_directory () {
	cd $1
	
	for file in `ls -l`; do
		# Get each line
		echo "File found : $file"
		# Get the first character to identify the type of file
		first_letter=${file:0:1}
		echo "First letter : $first_letter"
		# Get the last word in the string (File's name)
		last_word=${file##* }
		echo "Last word : $last_word"

		case $first_letter in
			"-" | "l")
				echo "This is a file or a link."
				#chmod o+r $last_word
				;;
			"d")
				echo "This is a directory."
				#chmod o+rx $last_word
				;;
			*)
				echo "Other."
				;;
		esac
	done
}

# We move to the log directory
directory="/var/log"

# We change the Internal Field Separator (IFS)
# Space by default
old_IFS=$IFS
IFS=$'\n'

Browse_directory $directory

# Set up the default IFS
ISF=$old_IFS

exit 0
