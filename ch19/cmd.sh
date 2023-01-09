# generate deployment template, then modify it to daemonset template
kubectl create deploy redis-ds-ch19 --image=redis:5-alpine --dry-run=client -o yaml

# modify deployment template:
# 1) kind: Deployment --> DaemonSet
# 2) delete spec.replicas
# 3) delete spec.strategy

# remove taint from master node
kubectl taint node ubuntu2204-master node-role.kubernetes.io/control-plane:NoSchedule-

