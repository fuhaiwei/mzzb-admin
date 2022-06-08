# Install

## Install JDK 17

```bash
sudo apt install openjdk-17-jdk-headless -y
```

## Install MySQL 8

open https://mirrors.tuna.tsinghua.edu.cn/help/mysql/

```bash
sudo apt edit-sources
sudo apt-key adv --keyserver http://repo.mysql.com/RPM-GPG-KEY-mysql-2022  --recv-key 467B942D3A79BD29

sudo apt update
sudo apt install mysql-server -y
mysql_secure_installation
```

## Install Docker

open https://www.runoob.com/docker/docker-tutorial.html

```bash
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
sudo tee /etc/docker/daemon.json >/dev/null <<EOF
{
  "registry-mirrors": [
    "https://hub-mirror.c.163.com"
  ]
}
EOF
```

## Install Mzzb Server

```bash
git clone git@github.com:mingzuozhibi/mzzb-server.git ~/mzzb-server
cd ~/mzzb-server/etc
cp app.properties.default app.properties
vim app.properties
```

## Install Mzzb Admin

```bash
git clone git@github.com:mingzuozhibi/mzzb-admin.git ~/mzzb-admin

copy mingzuozhibi.com ssl cert to ~/mzzb-admin/nginx/etc/cert.d

cd /etc/systemd/system/
sudo ln -s /home/qcloud/mzzb-admin/system/mzzb-server.service
sudo systemctl enable mzzb-server.service

cat mzzb-admin/system/copy_to_crontab.sh
crontab -e
```
