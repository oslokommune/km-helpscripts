### Run kube bench to check your cluster for known vulnerabilities

1. Create bench namespace

kubectl create namespace bench

2. Run the job

kubectl apply -f job-eks.yaml -n bench


3. Check logs for complete run

k -n bench logs <pod-id>