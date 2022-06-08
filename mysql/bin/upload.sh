# 通用模块
logname=upload_mzzb_server
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
    echo $(/usr/bin/du -sh $1 | awk '{print $1}')
}

# 开始脚本
basepath=$HOME/backup/mzzb_server
mkdir -p $basepath

[[ -f $basepath/backup.sql ]] || exit
[[ -d $basepath/upload ]] || exit
cd $basepath/upload || exit

rm backup3.tgz
mv backup2.tgz backup3.tgz
mv backup1.tgz backup2.tgz
tar -czvf backup1.tgz ../backup.sql

Log "== Upload Mzzb Server: $(Now) =="
Log "backup file size: $(Duf backup1.tgz)"
Log ""

rm -rf .git
git init
git add .
git commit -m "backup update"
git remote add origin git@github.com:fuhaiwei/mzzb-backup.git
git push origin master -u -f
