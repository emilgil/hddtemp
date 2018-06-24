# hddtemp
##A Docker image for hddtemp 

Use hddtemp to monitor your hard drive temperatures. Based on the Ubuntu image it allows you to monitor your hard drives'  temperatures via Telnet or netcat on port 7634. Hddtemp requires su privileges to be able to connect to the drives, i.e. it is necessary to run the container with the --privileged flag. The advantage of that is that all devices are automatically made available inside the container so they do not need to be defined explicitly on startup.

Use the DRIVES parameter to specify what drives to monitor, for example `-e DRIVES=sda` to monitor /dev/sda or `-e DRIVES=sd[abcde]` to monitor /dev/sda through /dev/sde
```
$ docker run -d --name hddtemp -p 7634:7634 --privileged -e DRIVES=sd[abc] emilgil/hddtemp
```
or use Docker compose:
```yaml 
## docker-compose.yml
version: '3'
services:
  hddtemp:
    container_name: hddtemp
    image: emilgil/hddtemp:latest
    restart: Always
    privileged: true
    ports:
      - 7634:7634
    environment:
      - DRIVES=sd[abcde] 
```
