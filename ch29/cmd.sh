# create ResourceQuota template
kubectl create quota dev-qt --dry-run=client -o yaml

# create job
kubectl create job echo-1 -n ns-test --image=busybox -- echo hello
kubectl create job echo-2 -n ns-test --image=busybox -- echo hello

# creste pod without setting quota
kubectl run ngx-dev --image=nginx:alpine -n ns-test
