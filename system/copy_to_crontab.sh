# m h  dom mon dow   command

# user crontab -l
10 * * * * bash /home/ubuntu/admin/mysql/backup.sh
15 0 * * * bash /home/ubuntu/admin/mysql/upload.sh
00 0 * * * bash /home/ubuntu/admin/nginx/cut_nginx_log.sh
30 4 * * * bash /home/ubuntu/admin/system/do_apt_upgrade.sh
