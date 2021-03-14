GKE_CLUSTER=$1
GKE_ZONE=$2
GKE_PROJECT=$3
SPEC_FILE=$4

echo '=== Connect to Cluster ' $GKE_CLUSTER 'at' $GKE_ZONE 'in' $GKE_PROJECT
gcloud container clusters get-credentials $GKE_CLUSTER --zone $GKE_ZONE --project $GKE_PROJECT
gcloud config set project $GKE_PROJECT

kubectl create clusterrolebinding permissive-binding --clusterrole=cluster-admin \
--user=admin --user=kubelet --group=system:serviceaccounts:airflow

echo '=== Apply spec for airflow ' $SPEC_FILE
kubectl -n airflow apply -f $SPEC_FILE