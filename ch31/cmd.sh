# create deploy for checking network
kubectl create deploy ngx-dep-network --image=nginx:alpine --replicas=3

# check pod veth(virtual ethernet) via flannel plugin
kubectl exec ngx-dep-network-<xxx> -- ip addr

# check master/worker node veth
ip addr

# check cni0 network bridge
brctl show

# check route table on master/worker node
route

# check flannel plugin process flow
ip neighbor | grep <flannel.1 ip prefix>
bridge fdb | grep flannel

# delete flannel plugin
kubectl delete -f kube-flannel.yml

# get Calico plugin deploy script
curl https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/calico.yaml -O

# install Calico
kubectl apply -f calico.yaml

