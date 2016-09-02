# FTP download and sync to S3
A small utility to download files from a ftp-server and sync them to a S3 target.
Note: does not delete anything in the S3 target on sync.


## Requirements

Set these env-vars for AWS CLI (or less if using EC2-roles) (see [AWS CLI ENV-vars](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-environment)):
  * AWS_ACCESS_KEY_ID
  * AWS_SECRET_ACCESS_KEY
  * AWS_DEFAULT_REGION

## Temp-volume

Be sure to bind a temporary volume to `/backuptemp` (or somewhere else, but set env `TEMP_BACKUP_DIR` to that).
The utility downloads to this target before syncing to S3.

## Command
Entrypoint is the script [download_and_sync](download_and_sync).

The script takes these parameters:
    `ftp://user:password@ftp.host.org s3://mybucket/myfolder`

FTP-client: [lftp](http://lftp.yar.ru/).


## Example

`docker run --rm -it -e AWS_DEFAULT_REGION=eu-west-1 -e AWS_ACCESS_KEY_ID=xx -e AWS_SECRET_ACCESS_KEY=xx -v /backuptemp upptec/ftp_sync_to_s3 ftp://user:password@ftp.host.org s3://mybucket/myfolder`
