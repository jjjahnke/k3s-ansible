# https://thenewstack.io/tutorial-build-a-prometheus-dashboard-for-k3s-with-wio-terminal/

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://charts.helm.sh/stable
helm repo update

kubectl create ns prometheus
helm install prometheus prometheus-community/kube-prometheus-stack --namespace prometheusA

kubectl -n prometheus patch svc prometheus-kube-prometheus-prometheus -p '{"spec": {"type": "LoadBalancer"}}'
