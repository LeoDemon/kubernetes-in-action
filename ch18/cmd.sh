# create deploy template
kubectl create deployment ngx-dep-ch18 --image=nginx:alpine --dry-run=client -o yaml

# scale pods
kubectl scale --replicas=3 deploy ngx-dep-ch18

# get deploys or pods via lable filter
kubectl get deployments.apps -l app=ngx-dep-ch18
kubectl get pods -l app=ngx-dep-ch18
kubectl get pods -l 'app in(ngx-dep-ch18,nginx)'

