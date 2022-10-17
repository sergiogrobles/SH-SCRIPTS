#!/bin/zsh

# CURRENT DIR 
cd ~/important_dir


# DISPLAY PATH OF IMPORTANT DOCUMENT IF IT HAS BEEN MODIFIED WITHIN THE LAST 24 HOURS
targetDirectory=$(find ~/important_dir/important_doc -mtime -1)

# ABSOLUTE PATH OF 'targetDirectory' VARIABLE
AbsTargetPath=$(echo '/Users/home/important_dir/important_doc')


# DIRECTORY TO TAR.GZ
destinationDirectory=$(echo 'important_doc')

# BACKUP FILE VARIABLE
backupFileName=$(echo 'backupFile.tar.gz')

# LOG FILE // monitor when/if cronjob was scheduled and executed each backup period
backupLog=$(echo 'backup.log')



# --------------------
# DISPLAY VARIABLE VALUE TO USER
echo "File to backup: $destinationDirectory"

echo "Backup file name is: $backupFileName"
# ---------------------------



# IF NOT UPDATED, REDIRECT VARIABLE OUTPUT TO 'backup.log'
noUpdate=$(echo -n 'False:' ; date +%m/%d/%Y)

# IF UPDATED, REDIRECT VARIABLE OUTPUT TO 'backup.log'
yesUpdate=$(echo -n 'True:' ; date +%m/%d/%Y)



# --------------------


if [ $targetDirectory = $AbsTargetPath ]

then

	tar -czf $backupFileName $destinationDirectory & echo $yesUpdate >> $backupLog

else

	echo $noUpdate >> $backupLog

fi

# MOVE BACKUP FILE TO SPECIFIED DIRECTORY
mv $backupFileName ~/backupFiles/$backupFileName


# schedule cronjob to automate backup task whenever you'd like :)
