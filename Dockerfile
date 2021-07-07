FROM centos
MAINTAINER "sg sg@gmail.com"

#pass the build id for build version
ARG BUILD_ID=2
ARG BUILD_tool='docker cli'


RUN yum install httpd -y && \
    echo "Hello! This is task2" >> /var/www/html/dockertext.html && \
    echo "Page is built by $BUILD_tool" >> /var/www/html/dockertext.html

ADD https://raw.githubusercontent.com/Saurabh-tcs/okd-php/master/index.html /var/www/html/

ENV MY_OS=CENTOS \
    MY_SERVER='httpd server' \
    BUILD_VERSION=$BUILD_ID

COPY do180.html /var/www/html/

ENTRYPOINT ["httpd","-D","FOREGROUND"]

EXPOSE 80 8080 9080
