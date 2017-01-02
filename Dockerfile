FROM ubuntu
RUN apt-get update
RUN apt-get install apache2 apache2-utils libapache2-mod-python python-setuptools python-genshi -y
RUN apt-get install python-mysqldb -y
#RUN apt-get install trac -y
#---
RUN mkdir /opt/tracsetup
#COPY $WORKSPACE/* /opt/tracsetup/
ADD /var/lib/jenkins/jobs/Blitz-docker-CI-testing/workspace /opt/tracsetup/
RUN python /opt/tracsetup/setup.py install
#---
RUN mkdir /opt/test
RUN apt-get install sudo
COPY $WORKSPACE/DockerCloud-Blitz2017/docker-entrypoint.sh /usr/local/bin/
COPY $WORKSPACE/DockerCloud-Blitz2017/test.sh /opt/test.sh
RUN chmod 777 /opt/test.sh
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 8098
