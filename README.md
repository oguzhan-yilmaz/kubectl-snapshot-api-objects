# kubectl-snapshot-api-objects

This plugin loops through namespaces, Kubernetes API Object types and gets the `-o yaml` output for all of them, pipes it to `kubectl neat` and create a snapshot of the currently installed K8s API objects to filesystem.


## Requirements

- [yq](https://github.com/mikefarah/yq)
- ['kubectl neat' plugin](https://github.com/itaysk/kubectl-neat)

## Usage

```bash
kubectl krew install snapshot_api_objects
```

## Usage

```bash
Usage: kubectl snapshot_api_objects [OPTIONS]

Options:
    -n, --namespace      Optional: Specific namespace to export. Defaults to all namespaces
    -r, --resource-types Optional: Comma-separated list of resource types to export (e.g., "pods,deployments,services")
                        Defaults to all resource types
    -h, --help          Show this help message

Examples:
    kubectl snapshot_api_objects                                    # Export all resources from all namespaces
    kubectl snapshot_api_objects -n default                         # Export all resources from default namespace
    kubectl snapshot_api_objects -r pods,deployments                # Export only pods and deployments from all namespaces
    kubectl snapshot_api_objects -n default -r pods,deployments     # Export pods and deployments from default namespace
EOF
```

<!--
git update-index --chmod=+x snapshot-api-objects

chmod +x ~/.krew/store/snapshot_api_objects/v0.0.1/source/snapshot-api-objects-script.sh
 -->
