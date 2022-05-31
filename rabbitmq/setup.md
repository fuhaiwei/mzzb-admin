# Setup RabbitMq

```shell
sudo rabbitmq-plugins enable rabbitmq_management
sudo rabbitmqctl add_user admin admin
sudo rabbitmqctl set_user_tags admin administrator
sudo rabbitmqctl set_permissions admin ".*" ".*" ".*"
```
