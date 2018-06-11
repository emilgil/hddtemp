#
# hddtemp Dockerfile
#
# Pull base image.
FROM ubuntu
MAINTAINER emilgil
# Install hddtemp
RUN apt-get update && apt-get -y install apt-utils build-essential hddtemp
EXPOSE 7634
# Define default command. example = -d --listen localhost
# --port 7634 /dev/s*
#CMD ["hddtemp", "-q", "-d", "-F", "$DRIVES"]
#CMD ["hddtemp","-q","-F","-d","/dev/sda"] #FUNGERAR!
#docker run -d --name hddtemp -p 7634:7634 --privileged --device /dev/sda:/dev/sda hddtemp-emilgil
#CMD ["hddtemp","-q","-F","-d","/dev/sda","/dev/sdb","/dev/sdc","/dev/sdd","/dev/sde"] #FUNGERAR
#docker run -d --name hddtemp -p 7634:7634 --privileged --device /dev/sda:/dev/sda --device /dev/sdb:/dev/sdb --device /dev/sdc:/dev/sdc --device /dev/sdd:/dev/sdd hddtemp-emilgil
ENTRYPOINT exec hddtemp -q -d -F /dev/$DRIVES
#docker run -d --name hddtemp -p 7634:7634 --privileged -e DRIVES=sd[ab] hddtemp-emilgil
