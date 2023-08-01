# For x64 CPUs and without a web server or reverse proxy (like Apache, Nginx and else) already in place:
docker run \
	--sig-proxy=false \
	--name nextcloud-aio-mastercontainer \
	--restart always \
	--publish 8080:8080 \
	--publish 8443:8443 \
	--volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
	--volume /var/run/docker.sock:/var/run/docker.sock:ro \
	nextcloud/all-in-one:latest
