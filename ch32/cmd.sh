# download dashboard install file
wget -c https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
mv recommended.yaml dashboard.yaml

# create proxy server between localhost and kubernetes api-server
kubectl proxy

# access dashboard via proxy server
curl -i http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

