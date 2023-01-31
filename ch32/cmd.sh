# download dashboard install file
wget -c https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
mv recommended.yaml dashboard.yaml

# create proxy server between localhost and kubernetes api-server
kubectl proxy

# access dashboard via proxy server
curl -i http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

# create https certificate
openssl req -x509 -days 365 -out k8s.test.crt -keyout k8s.test.key \
  -newkey rsa:2048 -nodes -sha256 \
    -subj '/CN=k8s.test' -extensions EXT -config <( \
       printf "[dn]\nCN=k8s.test\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:k8s.test\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth")

# create secret for https certificate
kubectl create secret tls dash-tls -n kubernetes-dashboard --cert=k8s.test.crt --key=k8s.test.key --dry-run=client -o yaml > cert.yaml
kubectl apply -f cert.yaml

# create ingress template
kubectl create ing dash-ing --rule="k8s.test/=kubernetes-dashboard:443" --class=dash-ink -n kubernetes-dashboard --dry-run=client -o yaml

# create ingress controller service template
kubectl expose deployment dashboard-kic-dep --name=dashboard-kic-svc --type=NodePort --port=443 --target-port=443 -n nginx-ingress --dry-run=client -o yaml

# host resolve config
echo "192.168.10.128 k8s.test" >> /etc/hosts

# create service-account for accessing dashboard
# visit `https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md`

# get access token
kubectl create token admin-user -n kubernetes-dashboard 


