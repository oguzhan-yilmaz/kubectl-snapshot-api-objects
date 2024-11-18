# kubectl-snapshot-api-objects

This plugin loops through namespaces, Kubernetes API Object types and gets the `-o yaml` output for all of them, pipes it to `kubectl neat` and create a snapshot of the currently installed K8s API objects to filesystem.

## Dependencies

<!-- - [yq](https://github.com/mikefarah/yq) -->

- ['kubectl neat' plugin](https://github.com/itaysk/kubectl-neat)
  ```bash
  kubectl krew install neat
  ```

## Installation

```bash
kubectl krew install snapshot-api-objects
```

## Usage

**Snapshot all API Object types from all Namespaces**

```bash
kubectl snapshot-api-objects
```

**Snapshot selected Namespaces**

```bash
kubectl snapshot-api-objects -n default,kube-system
```

**Snapshot selected Resource Types**

```bash
kubectl snapshot-api-objects -r pods,configmaps,deployments

```

**Snapshot selected Resource Types and Namespaces**

```bash
kubectl snapshot-api-objects \
    -r pods,configmaps,deployments \
    -n default,kube-system

```

**`kubectl snapshot-api-objects --help`**

```bash
Usage: kubectl snapshot-api-objects [OPTIONS]

Options:
    -n, --namespace      Optional: Specific namespace to export. Defaults to all namespaces
    -r, --resource-types Optional: Comma-separated list of resource types to export (e.g., "pods,deployments,services")
                            Defaults to all resource types
    -h, --help          Show this help message

Examples:
    # Export all resources from all namespaces
    kubectl snapshot-api-objects                                                

    # Export all resources from default and kube-system namespaces
    kubectl snapshot-api-objects -n default,kube-system                         

    # Export only pods and deployments from all namespaces
    kubectl snapshot-api-objects -r pods,deployments                            

    # Export pods and deployments from default and kube-system namespaces
    kubectl snapshot-api-objects -n default,kube-system -r pods,deployments     
EOF
```

<!--
git update-index --chmod=+x snapshot-api-objects

chmod +x ~/.krew/store/snapshot-api-objects/v0.0.1/source/snapshot-api-objects-script.sh
 -->

## Local Installation

```bash
curl -sL https://raw.githubusercontent.com/oguzhan-yilmaz/kubectl-snapshot-api-objects/refs/heads/main/.krew.yaml -o snapshot-api-objects.krew.yaml

kubectl krew uninstall snapshot-api-objects || true

kubectl krew install --manifest=snapshot-api-objects.krew.yaml

# make kubectl krew plugin executable upon local installation
chmod +x ~/.krew/store/snapshot-api-objects/v*/snapshot-api-objects

kubectl snapshot-api-objects -n default
```
