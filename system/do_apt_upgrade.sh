# 通用模块
logname=do_apt_upgrade
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
Log "== Do Apt Upgrade: $(Now) ==" >>$logfile

Run sudo apt-get update

Run sudo apt list --upgradable 2>/dev/null

Run sudo apt-get dist-upgrade -y

Run sudo apt-get autoremove -y

Run sudo apt-get autoclean -y

if [ $(date +%w) -eq 1 ]; then
    Run sudo reboot
fi
