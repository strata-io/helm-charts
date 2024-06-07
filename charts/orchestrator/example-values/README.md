# Example values.yaml configurations

The YAML files in this directory provide basic example configurations for common 
Orchestrator deployment scenarios on Kubernetes.

* [minimal-orchestrator-openshift.yaml](./minimal-orchestrator-openshift.yaml) 
  
  TODO

* [minimal-orchestrator-standalone-cloud-local-config.yaml](./minimal-orchestrator-standalone-cloud-local-config.yaml) 
  
  TODO

* [minimal-orchestrator-standalone.yaml](./minimal-orchestrator-standalone.yaml) 

    This examplee installs a bare-minimal single instance Orchestrator. This is useful as a basic 
starter template.

* [minimal-orchestrator-custom-configmap.yaml](./minimal-orchestrator-custom-configmap.yaml) 
  
    This example describes how to link an ConfigMap which contains Maverics Orchestrator yaml configuration.

    Example of generating a ConfigMap from a custom ConfigMap object from a local config file.

    ```kubectl create configmap mycustomconfig --from-file=maverics.yml=/etc/maverics/maverics-k8s.yaml```

