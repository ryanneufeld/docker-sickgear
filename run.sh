docker run --name=sickgear -v /data/downloads:/downloads:rw -v /data/dropbox/Dropbox/Torrents:/torrents:rw -v /media:/media:ro -v /data/sickgear:/data:rw -d -p 8081:8081 --restart always sickgear
