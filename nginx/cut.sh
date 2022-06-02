thePath="$(realpath $(dirname $0))"
logBase=$thePath/log
logFile=$logBase/nginx.log
fmtDate=$(date -d '1 days ago' +%Y%m%d)

function Now() {
    echo $(date '+%Y/%m/%d %H:%M:%S')
}

function Log() {
    echo "$*" >>$logFile
}

function Wcl() {
    echo $(wc -l $1 | awk '{print $1}')
}

mv $logBase/access.log $logBase/access.tmp
mv $logBase/error.log $logBase/error.tmp
bash $thePath/app.sh kcut

mkdir -p $logBase/backup
cat $logBase/access.tmp >>$logBase/backup/$fmtDate-access.log
cat $logBase/error.tmp >>$logBase/backup/$fmtDate-error.log

Log "== Cut Nginx Log: $(Now) =="
Log "access.log: $(Wcl $logBase/access.tmp) lines"
Log "error.log: $(Wcl $logBase/error.tmp) lines"
Log ""

sudo rm $logBase/access.tmp
sudo rm $logBase/error.tmp
find $logBase/backup -type f -mtime +30 -delete
