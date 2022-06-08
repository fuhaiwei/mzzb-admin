# Install

## Install JDK 17

```bash
sudo apt install openjdk-17-jdk-headless -y
```

## Install Redis

```bash
sudo apt install redis -y
```

## Install Chrome

```bash
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/chrome.list'
sudo apt update && sudo apt install google-chrome-stable -y
```

## Install Mzzb Spider

```bash
git clone git@github.com:mingzuozhibi/mzzb-spider.git ~/mzzb-spider
cd ~/mzzb-spider/etc
cp app.properties.default app.properties
vim app.properties
```

## Install Mzzb Admin

```bash
git clone git@github.com:mingzuozhibi/mzzb-admin.git --branch=bcloud ~/mzzb-admin

cd /etc/systemd/system/
sudo ln -sf /home/bcloud/mzzb-admin/system/mzzb-spider.service
sudo systemctl enable mzzb-spider.service

cat ~/mzzb-admin/system/copy_to_crontab.sh
crontab -e
```
