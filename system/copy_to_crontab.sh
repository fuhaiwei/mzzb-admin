# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
#
# For more information see the manual pages of crontab(5) and cron(8)
#
# m h dom mon dow command

10 * * * * bash -l ~/mzzb-admin/mysql/bin/backup.sh >/dev/null 2>&1
15 0 * * * bash -l ~/mzzb-admin/mysql/bin/upload.sh >/dev/null 2>&1
00 0 * * * bash -l ~/mzzb-admin/nginx/bin/backup.sh >/dev/null 2>&1
30 3 * * * bash -l ~/mzzb-admin/system/do_apt_upgrade.sh >/dev/null 2>&1
