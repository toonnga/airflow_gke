airflow-gke
====

Airflow-GKE project for deploy airflow and components into GKE.

## Step for Deploy:

    1. run ./overlay_pull.sh
    2. edit any configurations in /overlays/{project_id}
    3. run ./build.sh
    4. run ./deployment_{project_name}.sh

## base - airflow deployment

run airflow in LocalExecutor
    - postgres - db for airflow
    - airflow webserver
    - airlfow scheduler

## base_nfs - nfs-server for make pvc in RWX mode 
purposed to: mount airflow logs into airflow webserver and airflow scheduler
solve issued: https://issues.apache.org/jira/browse/AIRFLOW-4922

## overlays/{project_id}

    - config
        - airflow.cfg - airflow configuration
        - iap-webserver.properties - airflow webserver's credential
        - ingress_wenserver.yaml - yaml file to replace static ip name and host name
        - postgres_config.properties - postgres configuration
    - resource
        - create-connection.sh - scripts for create connection after airflow start
        - *.json - service-accounts
        - tls.crt/tls.key - certification
        - webserver_config.py - config for authentication by oauth credential

## other scripts

- build.sh - build deployment spec --> output on path: /output/....yaml
- deploy_de-exam-kansine.sh - deploy spec deployment to gke
- deployment_template.sh - deployment template
- overlay_pull.sh - pull overlays from gcs
- overlay_push.sh - push overlays to gcs
