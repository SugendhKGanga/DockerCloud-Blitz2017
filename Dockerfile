FROM ubuntu
RUN apt-get update
RUN apt-get install apache2 apache2-utils libapache2-mod-python python-setuptools python-genshi -y
RUN apt-get install python-mysqldb -y
RUN apt-get install trac -y
RUN apt-get remove trac -y

#---
RUN mkdir /opt/tracsetup
COPY $WORKSPACE/trunk/ /opt/tracsetup/
RUN cd /opt/tracsetup/ && python ./setup.py install
#---
RUN mkdir /opt/test
RUN apt-get install sudo
COPY docker-entrypoint.sh /usr/local/bin/
COPY test.sh /opt/test.sh
RUN chmod 777 /opt/test.sh
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
EXPOSE 8098
