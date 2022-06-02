name="app-nginx"
dest="nginx:mainline"
home="$(realpath $(dirname $0))"

case $1 in
init)
    mkdir -p $home/www
    mkdir -p $home/log
    sudo docker rm -f $name
    sudo docker run --name $name \
        -v $home/etc/nginx.conf:/etc/nginx/nginx.conf:ro \
        -v $home/etc/conf.d:/etc/nginx/conf.d:ro \
        -v $home/etc/cert.d:/etc/nginx/cert.d:ro \
        -v $home/log:/var/log/nginx \
        -v $home/www:/usr/share/nginx/html:ro \
        -p 80:80 \
        -d $dest
    ;;
stop)
    sudo docker stop $name
    ;;
bash)
    sudo docker exec -it $name bash
    ;;
kcut)
    sudo docker exec $name bash -c 'kill -USR1 $(cat /var/run/nginx.pid)'
    ;;
*)
    echo "sh app.sh init"
    echo "sh app.sh stop"
    echo "sh app.sh bash"
    echo "sh app.sh kcut"
    ;;
esac
