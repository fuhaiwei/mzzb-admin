# 通用模块
logName=split_nginx_log
logBase=$HOME/task_logs
logFile=$logBase/$logName.log

mkdir -p $logBase

function Now() {
    echo $(date '+%Y/%m/%d %H:%M:%S')
}

function Log() {
    echo "$*" >>$logFile
}

function Wcl() {
    echo $(/usr/bin/wc -l $1 | awk '{print $1}')
}

# 开始脚本
thePath="$(realpath $(dirname $0)/..)"
logRoot=$thePath/log
fmtDate=$(date -d '1 days ago' +%Y%m%d)

mkdir -p $logRoot/backup

mv $logRoot/visit.log $logRoot/visit.tmp
mv $logRoot/error.log $logRoot/error.tmp
bash $thePath/app.sh kcut

cat $logRoot/visit.tmp >>$logRoot/backup/$fmtDate-visit.log
cat $logRoot/error.tmp >>$logRoot/backup/$fmtDate-error.log

Log "== Split Nginx Log: $(Now) =="
Log "visit.log: $(Wcl $logRoot/visit.tmp) lines"
Log "error.log: $(Wcl $logRoot/error.tmp) lines"
Log ""

sudo rm $logRoot/visit.tmp
sudo rm $logRoot/error.tmp
find $logRoot/backup -type f -mtime +30 -delete
