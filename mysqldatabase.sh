#!/bin/bash
timestamp=$(date +"%F")
backup_path="/home/parthiban/mysql_backup/$TIMESTAMP"
mysql_user="parthiban"
mysql_password="arun"
db="db1"  
mysql --user=$mysql_user --password=$mysql_password  --db=$db | grep -Ev "(Database|information_schema|performance_schema)"

mysqldump --force --opt --user=$mysql_user --password=$mysql_password --databases $db | gzip > "$backup_path/$db.gz"

