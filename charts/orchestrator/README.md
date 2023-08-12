# Orchestrator for Kubernetes

[Orchestrator for Kubernetes](https://strata-io.github.io/helm-charts) is the fastest way to deploy Identity Orchestration on Kubernetes.

This chart bootstraps an Orchestrator deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Table of contents

- [Prerequisites](#prerequisites)
- [Install](#install)
- [Upgrade](#upgrade)
- [Uninstall](#uninstall)
- [FAQs](#faqs)
- [Deployment Options](#deployment-options)
- [Configuration](#configuration)

## Prerequisites

Kubernetes: `>=1.20.0-0`

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