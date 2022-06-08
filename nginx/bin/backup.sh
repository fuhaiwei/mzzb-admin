thePath="$(realpath $(dirname $0)/..)"
logBase=$thePath/log
logFile=$logBase/backup.log
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

mv $logBase/visit.log $logBase/visit.tmp
mv $logBase/error.log $logBase/error.tmp
bash $thePath/app.sh kcut

mkdir -p $logBase/backup
cat $logBase/visit.tmp >>$logBase/backup/$fmtDate-visit.log
cat $logBase/error.tmp >>$logBase/backup/$fmtDate-error.log

Log "== Split Nginx Log: $(Now) =="
Log "visit.log: $(Wcl $logBase/visit.tmp) lines"
Log "error.log: $(Wcl $logBase/error.tmp) lines"
Log ""

sudo rm $logBase/visit.tmp
sudo rm $logBase/error.tmp
find $logBase/backup -type f -mtime +30 -delete
