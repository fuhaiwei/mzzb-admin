name="app-rabbitmq"
dest="rabbitmq:3-management"
home="$(realpath $(dirname $0))"

case "$1" in
init)
	mkdir -p "$home"/data
	sudo docker rm -f "$name"
    sudo docker run --name "$name" \
		--hostname "$name" \
		-v "$home"/data:/var/lib/rabbitmq \
		-v "$home"/etc:/etc/rabbitmq:ro \
        -p 5672:5672 \
        -p 15672:15672 \
        -d "$dest"
    ;;
stop)
	sudo docker stop "$name"
	;;
bash)
    sudo docker exec -it "$name" bash
    ;;
*)
    echo "sh app.sh init"
    echo "sh app.sh stop"
    echo "sh app.sh bash"
    ;;
esac
