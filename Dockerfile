FROM php:5.6-apache
RUN apt-get update && \
    apt-get install -y apache2 python-pip libnet1 libnet1-dev libpcap0.8 libpcap0.8-dev git wget

RUN git clone https://github.com/savmuv/Bakaleechv2.git ./

ADD https://raw.githubusercontent.com/wpzzz/docker-rapidleech/master/config.php configs/ 

RUN chmod 777 -R files
RUN chmod 777 -R rar
RUN chmod 777 -R configs

COPY ./ /var/www/html

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR

EXPOSE  80
