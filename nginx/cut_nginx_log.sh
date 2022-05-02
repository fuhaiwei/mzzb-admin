# 通用模块
logname=cut_nginx_log
logbase=$HOME/task_logs
logfile=$logbase/$logname.log
mkdir -p $logbase

function Now() {
    echo $(date '+%Y/%m/%d %H:%M:%S')
}

function Log() {
    echo "$*" >>$logfile
}

function Wcl() {
    echo $(wc -l $1 | awk '{print $1}')
}

# 环境准备
base=/home/ubuntu/nginx/log
fmtd=$(date -d '1 days ago' +%Y%m%d)
mkdir -p $base/backup

# 切断日志
sudo mv $base/info.log $base/info.temp
sudo mv $base/error.log $base/error.temp
sudo kill -USR1 $(cat /var/run/nginx.pid)

# 归档日志
cat $base/info.temp >>$base/backup/info-$fmtd.log
cat $base/error.temp >>$base/backup/error-$fmtd.log

# 自身日志
Log "== Cut Nginx Log: $(Now) =="
Log "info.log: $(Wcl $base/info.temp) lines"
Log "error.log: $(Wcl $base/error.temp) lines"
Log ""

# 清理工作
sudo rm $base/info.temp
sudo rm $base/error.temp
find $base/backup -type f -mtime +30 | xargs -I {} rm {}
