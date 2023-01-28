# create HorizontalPodAutoscaler
kubectl autoscale deploy ngx-hpa-dep-ch30 --min=1 --max=10 --cpu-percent=5 --dry-run=client -o yaml

# create httpd for `Apache Bench`
kubectl run test -it --image=httpd:alpine -- sh

# send batch requests to nginx hpa svc
ab -c 10 -t 60 -n 1000000 'http://ngx-hpa-svc-ch30/'

