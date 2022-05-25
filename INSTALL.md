# Install

## Install JDK 8

open https://mirrors.tuna.tsinghua.edu.cn/Adoptium/8/jdk/x64/linux/

```bash
mkdir -p .local/opt && cd .local/opt
tar xzvf OpenJDK8U-*.tar.gz && ln -s jdk8* jdk-8
export JAVA_HOME=/home/ubuntu/.local/opt/jdk-8
export PATH=$JAVA_HOME/bin:$PATH
```

## Install MySQL 8

open https://mirrors.tuna.tsinghua.edu.cn/help/mysql/

```bash
sudo apt edit-sources
sudo apt update
sudo apt install mysql-server -y
mysql_secure_installation
```

## Install RabbitMQ

open https://www.rabbitmq.com/install-debian.html#apt-quick-start-cloudsmith

```bash
sh ~/admin/rabbitmq/install.sh
```

## Install Nginx

```bash
sudo apt install nginx -y
```

## Install Mzzb Server

```bash
git clone git@github.com:mingzuozhibi/mzzb-server.git
git clone git@github.com:mingzuozhibi/mzzb-admin.git admin
```
