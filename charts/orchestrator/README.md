# Maverics Orchestrator for Kubernetes

[Maverics Orchestrator for Kubernetes](https://strata-io.github.io/helm-charts) is
the fastest way to deploy Identity Orchestration on Kubernetes.

This chart bootstraps a Maverics Orchestrator deployment on a
[Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package
manager.

## Table of contents

- [Maverics Orchestrator for Kubernetes](#maverics-orchestrator-for-kubernetes)
  - [Table of contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Add and Update Repo](#add-and-update-repo)
  - [Install](#install)
  - [Upgrade](#upgrade)
    - [Upgrading to 1.0.0](#upgrading-to-100)
  - [Example Values](#example-values)
  - [Uninstall](#uninstall)
  - [FAQs](#faqs)
  - [Deployment Options](#deployment-options)
  - [Configuration](#configuration)
  - [Troubleshooting](#troubleshooting)
    - [Pod Won't Start](#pod-wont-start)

## Prerequisites

Kubernetes: `>=1.24.0-0`

## Add and Update Repo

```console
helm repo add strata https://strata-io.github.io/helm-charts
helm repo update
```

## Install

**Important:** Only Helm3 is supported.

Deploy the Orchestrator into an existing namespace:
```console
helm install [RELEASE_NAME] strata/orchestrator --namespace [EXISTING_NAMESPACE]
```

Deploy the Orchestrator into a new namespace. Upgrade the the deployment if it
already exists.
```console
helm upgrade maverics . --namespace [NEW_NAMESPACE]--create-namespace --values [PATH_TO_VALUES_YAML] --install
```

## Upgrade
```console
helm upgrade [RELEASE_NAME] strata/orchestrator --namespace [NAMESPACE]
```

_See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation._

### Upgrading to 1.0.0

Version 1.0.0 introduces **breaking changes**:

#### Terminology: "orchestrator groups" renamed to "clusters"

| Before (0.x) | After (1.0.0) |
|--------------|---------------|
| `orchestrator.groups.*` | `orchestrator.clusters.*` |
| `features.experimental.orchestratorGroups` | `features.experimental.clusters` |
| `http.routing.type: group` | `http.routing.type: cluster` |
| `MAVERICS_GROUPS_PRIMARY_*` env vars | `MAVERICS_CLUSTERS_PRIMARY_*` |
| `<release>-groups` headless service | `<release>-clusters` |

#### Default configuration changes

| Setting | Before (0.x) | After (1.0.0) |
|---------|--------------|---------------|
| `replicaCount` | `3` | `1` |
| `baseConfig` | Included full cluster configuration | Minimal (only `version` and `http.address`) |

Clustering is now an opt-in feature. Users who want clustering must explicitly configure it via `customConfig`. See [example-values/minimal-orchestrator-clusters.yaml](example-values/minimal-orchestrator-clusters.yaml) for a complete example.

#### Migration example

```yaml
# Before (0.x)
orchestrator:
  groups:
    create: true
    primary:
      name: my-group

# After (1.0.0)
orchestrator:
  clusters:
    create: true
    primary:
      name: my-cluster
```

## Example Values

Example values files can be found under [example-values/README.md](example-values/README.md).

## Uninstall
```console
helm uninstall [RELEASE_NAME] --namespace [NAMESPACE]
```

## FAQs

Please read the
[FAQs](./FAQs.md)
document.

## Deployment Options

## Configuration

See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing). To see all configurable options with detailed comments, visit the chart's [values.yaml](./values.yaml), or run these configuration commands:

```console
helm show values strata/orchestrator
```

## Troubleshooting
### Pod Won't Start
If the pod will not start you can validate the reason using the following command
```console
kubectl describe pod [RELEASE_NAME]-orchestrator-0 
```

At the bottom under `Events:` you should be able to see output similiar to below
```console
  Type     Reason       Age                   From               Message
  ----     ------       ----                  ----               -------
  Warning  FailedMount  119s (x10 over 6m9s)  kubelet            MountVolume.SetUp failed for volume "orchestrator-config" : configmap "myCustomConfig" not found
```