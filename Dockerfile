FROM debian

MAINTAINER "Daniel Requena"

EXPOSE 80

RUN apt-get update && apt-get -y upgrade && apt-get install -y python3 python3-pip
RUN apt-get clean
RUN pip3 install django
RUN mkdir -p /var/www
WORKDIR /var/www

RUN /usr/local/bin/django-admin.py startproject mydjangoapp

ENTRYPOINT ["python3", "/var/www/mydjangoapp/manage.py", "runserver", "0.0.0.0:80"]
