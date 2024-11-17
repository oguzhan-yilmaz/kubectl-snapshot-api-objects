#!/usr/bin/env bash

if kubectl neat --help >/dev/null 2>&1; then
    log "Dependency 'kubectl neat' plugin is installed."
else
    echo "Dependency 'kubectl neat' pluging is NOT installed. Aborting..."
    exit 1
fi

# Check for yq
if check_command yq; then
    log "Dependecy 'yq' is installed."
else
    echo "Dependecy 'yq' is NOT installed. Aborting..."
    exit 1
fi

set -euxo pipefail

mkdir -p dist

rm ./dist/*.tar.gz || true
kubectl krew uninstall snapshot_api_objects || true

tar -czvf dist/local-package.tar.gz src/ LICENSE
rm snaphsot_api_objects.local.yaml|| true

shasum -a 256 ./dist/local-package.tar.gz
export ABC=$(sha256sum ./dist/local-package.tar.gz | awk '{ print $1 }')

yq eval '.spec.platforms[].sha256 = env(ABC)' snapshot_api_objects.yaml > snapshot_api_objects.local.yaml
yq eval '.spec.version = "v0.0.1"' -i snapshot_api_objects.local.yaml

kubectl krew install --manifest=snapshot_api_objects.local.yaml --archive=./dist/local-package.tar.gz

chmod +x ~/.krew/store/snapshot_api_objects/v0.0.1/snapshot_api_objects.sh

kubectl krew list