# Strata Identity Kubernetes Helm Charts

This is the official Helm Charts repository for installing the Strata Identity 
Orchestration platform on Kubernetes.

## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add strata https://strata-io.github.io/helm-charts

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
strata` to see the charts.

To install the orchestrator chart:

    helm install my-orchestrator strata/orchestrator

To uninstall the chart:

    helm delete my-orchestrator

## Documentation
The documentation for the Orchestrator Helm Chart is available [here](https://github.com/strata-io/helm-charts/charts/orchestrator/README.md)

## Support
If you run into an issue, bug or have a question, please reach out to the [Strata Identity team](https://www.strata.io/company/contact/).
