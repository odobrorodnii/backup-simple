#!/bin/bash


# variables
TAR=/bin/tar
DATE=/bin/date
MYSQLDUMP=/usr/bin/mysqldump

# databases backup
$MYSQLDUMP -A --add-locks -u root --password=`cat /root/pass` > /backup/dump/dbases.sql
$TAR -zcvf /backup/dump/dbases.tar.gz /backup/dump/dbases.sql
rm -f /backup/dump/dbases.sql

# sites backup
for fol in `ls /var/www`
do
ARCHFILE=/backup/daily/$fol.tar.gz
$TAR -zcvf $ARCHFILE /var/www/$fol
done

# configs backup
#$TAR -zcvf /backup/daily/etc.tar.gz /etc
