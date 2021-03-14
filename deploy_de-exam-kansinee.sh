echo '=== Create Puller'

kubectl create namespace airflow

kubectl -n airflow create secret docker-registry \
    gcr-puller \
    --docker-server=https://us.gcr.io \
    --docker-username=_json_key \
    --docker-password="$(cat overlays/de-exam-kansinee/resource/de-exam-kansinee-gcr-puller.json)" \
    --docker-email=gcr-puller@de-exam-kansinee.iam.gserviceaccount.com

echo '=== Apply NFS spec'
./deploy_template.sh de-exam-kansinee-private-k8s asia-southeast1-a de-exam-kansinee output/base-nfs-spec.yaml
echo '=== Apply spec'
./deploy_template.sh de-exam-kansinee-private-k8s asia-southeast1-a de-exam-kansinee output/de-exam-kansinee-spec.yaml