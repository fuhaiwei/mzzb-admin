# 通用模块
logname=backup_mzzb_server
logbase=$HOME/task_logs
logfile=$logbase/$logname.log

mkdir -p $logbase

function Now() {
    echo $(date '+%Y/%m/%d %H:%M:%S')
}

function Log() {
    echo "$*" >>$logfile
}

function Duf() {
    echo $(/usr/bin/du -sh ${1} | awk '{print $1}')
}

# 环境准备
basepath=/home/qcloud/backup
database=mzzb_server
backroot=$basepath/$database
backfile=$backroot/backup.sql
mkdir -p $backroot

# 创建备份
mysqldump -uroot -p$DB_PASS $database >$backfile
Log "== Backup Mzzb Server: $(Now) =="
Log "backup file size: $(Duf $backfile)"
Log ""

# 存放每小时备份
datetext=$(date +%Y%m%d)
timetext=$(date +%H%M%S)
copypath=$backroot/hour_backup/$datetext
mkdir -p $copypath
gzip -c $backfile >$copypath/backup-$datetext-$timetext.sql.gz

# 清理超过七天的每小时备份
find $backroot/hour_backup -type f -mtime +6 | xargs -I {} rm {}

# 存放每天备份
monthtext=$(date +%Y%m)
copypath=$backroot/date_backup/$monthtext
mkdir -p $copypath
gzip -c $backfile >$copypath/backup-$datetext.sql.gz

# 清理超过一百天的每天备份
find $backroot/date_backup -type f -mtime +99 | xargs -I {} rm {}

# 清理空文件夹
find $backroot -type d -empty | xargs -I {} rm -rf {}
