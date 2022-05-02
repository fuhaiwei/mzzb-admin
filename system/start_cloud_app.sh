# 通用模块
logname=start_cloud_app
logbase=$HOME/task_logs
logfile=$logbase/$logname.log
mkdir -p $logbase

function Now() {
    echo $(date '+%Y/%m/%d %H:%M:%S')
}

function Log() {
    echo "$*" >>$logfile
}

function Run() {
    echo -e "\n$*\n" >>$logfile
    "$@" >>$logfile 2>&1
}

# 开始脚本
Log "== Start Cloud App: $(Now) =="

Run bash /home/ubuntu/mzzb-spider/app.sh st

Log ""
