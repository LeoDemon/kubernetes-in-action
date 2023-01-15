# access endpoint
curl -i <ClusterIP>:80 -H 'host: kong.test' -v
curl -i <ClusterIP>:80 -H 'host: kong.dev' -v
curl -i <ClusterIP>:80 -H 'host: kong.ops' -v

# or using resolve
curl -i --resolve kong.test:80:<ClusterIP> http://kong.test:80

# check kong plugins
kubectl api-resources | grep -i kong
kubectl explain kongplugins

