# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
#
# For more information see the manual pages of crontab(5) and cron(8)
#
# m h dom mon dow command

10 * * * * bash /home/ubuntu/mzzb-admin/mysql/bin/backup.sh
15 0 * * * bash /home/ubuntu/mzzb-admin/mysql/bin/upload.sh
00 0 * * * bash /home/ubuntu/mzzb-admin/nginx/bin/backup.sh
30 4 * * * bash /home/ubuntu/mzzb-admin/system/do_apt_upgrade.sh
