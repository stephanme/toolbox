# toolbox

A small alpine based docker image with some additional tools: curl, rsync, jq, sqlite

Useful for debugging or k8s jobs.

## Build

```
docker build -t ghcr.io/stephanme/toolbox .
# full rebuild (update base image and chrome)
docker build --pull --no-cache -t ghcr.io/stephanme/toolbox .
```

## Usage

```
docker run -it ghcr.io/stephanme/toolbox
kubectl run toolbox --image ghcr.io/stephanme/toolbox --command -- sh -c 'sleep infinity'
```

Attach to a pod for debugging:
```
kubectl debug --namespace <namespace> -it <pod> --image ghcr.io/stephanme/toolbox --target=<container>  --share-processes
```
or use example `toolbox-*.yaml` to deploy a toolbox to k8s, e.g. to check home assistant sqlite DB or prometheus disks.
