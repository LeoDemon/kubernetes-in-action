# create ingress template
kubectl create ing ngx-ing --rule="ngx.test/=ngx-svc:80" --class=ngx-ink --dry-run=client -o yaml

# resolve dns and visit
curl -i --resolve ngx.test.ch21:5015:127.0.0.1 http://ngx.test.ch21:5015

