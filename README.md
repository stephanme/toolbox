# toolbox

A small alpine based docker image with some additional tools: curl, rsync, jq, sqlite

Useful for debugging or k8s jobs.

## Build

```
docker build -t stephanme/toolbox .
# full rebuild (update base image and chrome)
docker build --pull --no-cache -t stephanme/toolbox .
```

## Usage

```
docker run -it stephanme/toolbox
```

Attach to a pod for debugging:
```
kubectl debug --namespace <namespace> -it <pod> --image stephanme/toolbox --target=<container>  --share-processes
```
or use example `toolbox.yaml` to deploy a toolbox to k8s, e.g. to check home assistant sqlite DB.
