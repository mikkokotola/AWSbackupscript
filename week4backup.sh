#!/bin/bash
directoryToBackup="/home/mkotola/AWS/Week4BackupService/WorkDir"
backupBucket="s3://kumpula-mk-backup-bucket/"

aws s3 sync $directoryToBackup $backupBucket