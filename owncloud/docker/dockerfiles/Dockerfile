FROM registry.bionic.labs:5000/centos6:latest
MAINTAINER captain@bionic.labs

# disable cp -i
RUN sed -i "s/alias cp/#alias cp/" ~/.bashrc

# alias cp='cp -i'

# install apr
RUN cd /tmp && \
  wget http://synology-1.bionic.labs/mirror/download/apr-1.5.2.tar.gz && \
  tar -xvf apr-1.5.2.tar.gz && \
  cd apr-1.5.2 && \
  ./configure && make && make install

# apr-util
RUN cd /tmp && \
  wget http://synology-1.bionic.labs/mirror/download/apr-util-1.5.4.tar.gz && \
  tar -xvf apr-util-1.5.4.tar.gz && \
  cd apr-util-1.5.4 && \
  ./configure --with-apr=/usr/local/apr && make && make install

# pcre
RUN cd /tmp && \
  wget http://synology-1.bionic.labs/mirror/download/pcre2-10.20.tar.gz && \
  yum install -y pcre-devel && \
  tar -xvf pcre2-10.20.tar.gz && \
  cd pcre2-10.20 && \
  ./configure && make && make install

# httpd
RUN cd /tmp && \
  wget http://synology-1.bionic.labs/mirror/download/httpd-2.4.16.tar.gz && \
  tar -xvf httpd-2.4.16.tar.gz && \
  cd httpd-2.4.16 && \
  ./configure --with-apr=/usr/local/apr --with-pcre=/usr/local/pcre && \
  make && make install


# php
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm && \
  yum install -y php-mcrypt php-pear-Net-Curl php-symfony-intl php-intl libxml2 libxml2-devel && \
  yum install -y zip-devel bzip2-devel curl-devel libpng-devel && \
  cd /tmp && \
  wget http://synology-1.bionic.labs/mirror/download/php-5.6.14.tar.gz && \
  tar -xvf php-5.6.14.tar.gz && \
  cd php-5.6.14 && \
  ./configure --with-apxs2=/usr/local/apache2/bin/apxs --with-mysql --with-pdo-mysql --enable-zip --with-zlib --with-gd --with-curl && \
  make && \
  make install && \
  cp php.ini-development /usr/local/lib/php.ini

RUN yum install -y php-JsonSchema php-domxml-php4-php5 php-jsonlint php-zipstream \
  php-ZendFramework2-Json php-ircmaxell-random-lib php-pclzip php-phpseclib-crypt-random php-symfony-dom-crawler

# owncloud
RUN cd /tmp && \
  rm -rf owncloud* && \
  wget http://synology-1.bionic.labs/mirror/download/owncloud-8.1.3.zip && \
  unzip owncloud-8.1.3.zip && \
  cp -r -f owncloud/* /usr/local/apache2/htdocs/ && \
  mkdir -p /usr/local/apache2/htdocs/data && \
  chmod -R 0770 /usr/local/apache2/htdocs/data && \
  sed -i "s/#LoadModule rewrite_module modules\/mod_rewrite.so/LoadModule rewrite_module modules\/mod_rewrite.so/" /usr/local/apache2/conf/httpd.conf && \
  sed -i "s/#LoadModule ssl_module modules\/mod_ssl.so/LoadModule ssl_module modules\/mod_ssl.so/" /usr/local/apache2/conf/httpd.conf && \
  sed -i "s/#LoadModule authn_socache_module modules\/mod_authn_socache.so/LoadModule authn_socache_module modules\/mod_authn_socache.so/" /usr/local/apache2/conf/httpd.conf && \
  sed -i "s/#LoadModule socache_shmcb_module modules\/mod_socache_shmcb.so/LoadModule socache_shmcb_module modules\/mod_socache_shmcb.so/" /usr/local/apache2/conf/httpd.conf && \
  sed -i "s/#Include conf\/extra\/httpd-ssl.conf/Include conf\/extra\/httpd-ssl.conf/" /usr/local/apache2/conf/httpd.conf

ADD ./ADD/owncloud.conf /usr/local/apache2/conf/extras/owncloud.conf
ADD ./ADD/owncloud.bionic.labs.crt /usr/local/apache2/conf/owncloud.bionic.labs.crt
ADD ./ADD/owncloud.bionic.labs.key /usr/local/apache2/conf/owncloud.bionic.labs.key

# set up apache SSL
RUN cd /tmp && \
      sed -i "s/\/usr\/local\/apache2\/conf\/server.crt/\/usr\/local\/apache2\/conf\/owncloud.bionic.labs.crt/" /usr/local/apache2/conf/extra/httpd-ssl.conf && \
      sed -i "s/\/usr\/local\/apache2\/conf\/server.key/\/usr\/local\/apache2\/conf\/owncloud.bionic.labs.key/" /usr/local/apache2/conf/extra/httpd-ssl.conf && \
      sed -i "s/www.example.com:443/owncloud.bionic.labs:443/" /usr/local/apache2/conf/extra/httpd-ssl.conf

# post install configuration
RUN echo "Include conf/extras/owncloud.conf" >> /usr/local/apache2/conf/httpd.conf && \
  chmod 744 /usr/local/apache2/conf/extras/owncloud.conf && \
  mkdir -p /usr/local/apache2/htdocs/data && chmod -R 0770 /usr/local/apache2/htdocs/data && \
  cp /tmp/owncloud/.htaccess  /usr/local/apache2/htdocs/ && \
  chown -R daemon:daemon /usr/local/apache2/htdocs/*

# RUN create users
RUN export OC_PASS=captain && \
  cd /usr/local/apache2/htdocs && \
  su -s /bin/sh daemon -c '/usr/local/bin/php occ  maintenance:install --database sqlite --admin-user admin --admin-pass password' && \
  su -s /bin/sh daemon -c '/usr/local/bin/php occ user:add --password-from-env --display-name=bionic --group=bionic bionic' && \
  su -s /bin/sh daemon -c '/usr/local/bin/php occ user:add --password-from-env --display-name=captain --group=bionic captain' && \
  su -s /bin/sh daemon -c '/usr/local/bin/php occ user:add --password-from-env --display-name=powers --group=powers powers' && \
  su -s /bin/sh daemon -c '/usr/local/bin/php occ user:add --password-from-env --display-name=sandy --group=sandy sandy' && \
  su -s /bin/sh daemon -c '/usr/local/bin/php occ user:add --password-from-env --display-name=wisdom --group=wisdom wisdom' && \
  su -s /bin/sh daemon -c '/usr/local/bin/php occ user:add --password-from-env --display-name=philflow --group=philflow philflow'

# set trusted domain
RUN sed -i "s/localhost/owncloud.bionic.labs/" /usr/local/apache2/htdocs/config/config.php

# NOT TO MANUALLY REINSTALL OWNCLOUD SET THIS IN /usr/local/apache2/htdocs/config.config.php
#   'installed' => false,

ADD ./ADD/run.sh /tmp/run.sh
RUN chmod 755 /tmp/run.sh

EXPOSE 443

CMD ["/tmp/run.sh"]


