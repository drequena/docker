FROM debian

MAINTAINER "Daniel"

EXPOSE 80

RUN apt-get update && apt-get -y upgrade && apt-get install -y apache2 python3 python3-pip libapache2-mod-wsgi-py3
RUN pip3 install django

VOLUME /opt/djangoapp:/var/www/django

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
