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

* [minimal-orchestrator-standalone-cloud-s3.yaml](./minimal-orchestrator-standalone-cloud-s3.yaml)
  This example describes how to configure the helm chart to use a shared storage provider such as an S3 bucket, github, etc for the maverics configuration bundle.

  For more information on supported shared providers, [https://developer.strata.io/orchestrator/setup/remote-config](https://developer.strata.io/orchestrator/setup/remote-config)

  

  Example of using inline
  ```
  env: 
     MAVERICS_AWS_CONFIG: '{"accessKeyID":"my-access-key-id","bucketName":"my-bucket-name","configurationFilePath":"my-configuration-file-path","region":"us-east-2","secretAccessKey":"my-secret-access-key"}'
    
  cloud:
    enabled: true
    config:
      createConfig: true
      bundlePublicKeyB64: "LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUZrd0V3W="
  ```

  Example of using a secret
  ```
  envValueFrom:
    MAVERICS_AWS_CONFIG:
      secretKeyRef:
        name: storage-provider-secret
        key: config.json

  cloud:
    enabled: true
    config:
      createConfig: true
      bundlePublicKeyB64: "LS0tLS1CRUdJTiBQVUJMSUMgS0VZLS0tLS0KTUZrd0V3W="
  ```

  Example of the secret manifest
  ```
  apiVersion: v1
  kind: Secret
  metadata:
    name: storage-provider-secret
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