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

* [minimal-orchestrator-standalone-storage-config.yaml](./minimal-orchestrator-standalone-storage-config.yaml)

  This example describes how to configure the helm chart to use a shared storage provider such as an S3 bucket, github, etc for the maverics configuration bundle.

  For more information on supported shared providers, [https://developer.strata.io/orchestrator/setup/remote-config](https://developer.strata.io/orchestrator/setup/remote-config)

  It supports both using inline values or a pre-created secret. Only one must be used at a time (config or configSecret) and if both are set the pre-created secret will take precedence. 

  Example of using inline
  ```
  configurationStorage:
  type: "MAVERICS_AWS_CONFIG"
  config:
    region: us-east-2
    bucketName: my-bucket-name
    accessKeyID: my-access-key-id
    secretAccessKey: my-secret-access-key
    configurationFilePath: my-configuration-file-path


  cloud:
    enabled: true
    createConfig: true
    config:
      bundlePublicKeyB64: [base64-encoded-public-key]
  ```

  Example of using a pre-created secret
  ```
  configurationStorage:
  type: "MAVERICS_AWS_CONFIG"
  configSecret:
    name: manual-storage-provider-secret
    key: config.json

  cloud:
    enabled: true
    createConfig: true
    config:
      bundlePublicKeyB64: [base64-encoded-public-key]
  ```

  Example manifest of the pre-created secret
  ```
  apiVersion: v1
  kind: Secret
  metadata:
    name: manual-storage-provider-secret
    namespace: default
  type: Opaque
  stringData:
    config.json: |
      {
        "bucketName": "maverics-development",
        "accessKeyID": "aws-access-key-id",
        "secretAccessKey": "aws-secret-access-key",
        "region": "aws-region",
        "configurationFilePath": "folder1/folder2"
      }
  ```