#!/bin/sh
set -e

NGINX_VERSION=1.16.0
NGINX_INSTALL_DIR=/home/worker/nginx

cd /home/worker/src
tar zxf nginx-${NGINX_VERSION}.tar.gz
unzip nginx-http-concat.zip -d nginx-http-concat
unzip nginx-logid.zip -d nginx-logid
cd /home/worker/src/nginx-${NGINX_VERSION}
./configure --prefix=${NGINX_INSTALL_DIR} --with-http_stub_status_module --with-http_ssl_module --with-http_v2_module \
       --add-module=../nginx-http-concat/nginx-http-concat-master --add-module=../nginx-logid/nginx-logid-master 1>/dev/null
make 1>/dev/null
make install
rm -rf /home/worker/src/nginx-*