# AWSbackupscript
Simple bash script to regularly back up a directory to an AWS S3 bucket.

## Description
This simple backup script makes regular backups of the desired directory (including all subdirectories) at 7.00 a.m. every Monday. The script uses an ASW S3 bucket for backing up the objects. The script utilises the AWS CLI command `sync`, which observes the changes made in the directory and only uploads objects (files) with changes in them since the last backup.

This solution utilises the ASW S3 buckets' configuration for handling versioning and lifecycle control:
 - Retain old versions of an object for 365 days
 - Use Server-Side Encryption (AES-256)
 - Use Intelligent Tiering for both current and previous versions of an object

## How to use
- Create an ASW S3 bucket with configuration:
 - Keep all versions of an object is ENABLED
 - Use Server-Side Encryption (AES-256)
 - Permissions for the bucket: only the IAM user account to be used for backup (for AWS educate: only my AWS account)
 - Transition to Intelligent Tiering right away for both current and previous versions of an object
 - Clean up previous versions 365 days after becoming noncurrent version

- Install AWS CLI and set up configuration with the same credentials that have been given write access to the bucket

- Add the directory to be backed up to the variable directoryToBackup in bash script week4backup.sh and the bucket ARN to the variable backupBucket.

- Add the bash script to the cronjobs to be run at the desired interval
