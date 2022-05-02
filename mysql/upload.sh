# 通用模块
logname=upload_mzzb_shelfs
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

# 开始脚本
basepath=/home/ubuntu/backup
database=mzzb_shelfs
init_tag=2299c5a

cd $basepath/$database || exit

rm upload/backup3.tgz
mv upload/backup2.tgz upload/backup3.tgz
mv upload/backup1.tgz upload/backup2.tgz
tar -czvf upload/backup1.tgz backup.sql

Log "== Upload Mzzb Shelfs: $(Now) =="
Log "backup file size: $(Duf upload/backup1.tgz)"
Log ""

git init
git reset $init_tag
git add upload/*.tgz
git commit -m "backup update"
git push -f
git gc
