docker run --name=sickrage --net=host -v /data/downloads:/downloads -v /data/dropbox/Dropbox/Torrents:/torrents -v /media:/media -d -p 8081:8081 --restart always sickrage
