#brew install kustomize
mkdir -p output
echo '===== Building Airflow ====='
echo '* Build deployment spec'
kustomize build overlays/de-exam-kansinee > output/de-exam-kansinee-spec.yaml
kustomize build base_nfs > output/base-nfs-spec.yaml