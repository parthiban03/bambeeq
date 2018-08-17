#!/bin/bash 
user="parthiban2"
password="PARTHIBAN2"
backup_path="/home/parthiban/mysql_backup"
db="db2"
date=$(date +%d-%b-%y-%m-%h-%s)
mysql --user=$user --password=$password --db=$db | grep -Ev "(Database|information_schema|performance_schema)"
mysqldump --force --opt --user=$user --password=$password --databases $db | gzip > "$backup_path/$db.gz"

