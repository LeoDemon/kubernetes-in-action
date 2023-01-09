# port forward for service
kubectl port-forward svc/ngx-svc-ch27 8080:80 &

# manage app update
kubectl rollout --help

# check deployment update status
kubectl rollout status deployment ngx-dep-ch27

# check update history
kubectl rollout history deployment ngx-dep-ch27

# check update history detail
kubectl rollout history deployment ngx-dep-ch27 --revision=2

# rollback version
kubectl rollout undo deploy ngx-dep-ch27 --to-revision=1

