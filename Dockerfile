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
ENTRYPOINT exec hddtemp -q -d -F /dev/$DRIVES

