FROM centos
MAINTAINER abacchus@outlook.com
ENV ServerName localhost
#Install Apache, Java 1.8, git, unzip and zip 
RUN yum -y install git unzip zip java-1.8.0-openjdk-headless httpd

#Apache www root is located at /var/www/html/

#Setup YUM repo for PHP 7.1
RUN yum -y install epel-release yum-utils && \
    yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum-config-manager --enable remi-php71 -y

#Install PHP 7.1.x and all of it's module
RUN yum -y install php71 php71-php php71-php-mysqlnd php71-php-pgsql \
    php71-php-bcmath php71-php-gd php71-php-intl php71-php-ldap php71-php-dbg \
    php71-php-mbstring php71-php-pdo php71-php-process php71-php-soap \
    php71-php-opcache php71-php-xml php71-php-gmp php-gmp composer && \
    yum clean all -y

#Start the apache service
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

#Expose the application to port 80 on the container
EXPOSE 80