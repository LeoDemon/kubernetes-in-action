#!/bin/sh

# chrono @ 2022-04

# in browser:
# http://192.168.10.208:80

# kubectl port-forward wp-pod 8080:80 &
# kubectl port-forward proxy-pod 8080:80 &

cat << "EOF" > `pwd`/ch15_proxy.conf
server {
  listen 80;
  default_type text/html;
  location / {
      proxy_http_version 1.1;
      proxy_set_header Host $host;
      # Linux
      # proxy_pass http://127.0.0.1:8080;
      # macOS
      proxy_pass http://host.docker.internal:8080;
  }
}
EOF

docker run -d -p 80:80 --rm \
    -v `pwd`/ch15_proxy.conf:/etc/nginx/conf.d/default.conf \
    nginx:1.22.1

