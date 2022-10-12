First set the container registry env var:

```
CONTAINER_REGISTRY=ghcr.io/yolocs
```

To just build the images:

```sh
goreleaser release --snapshot --rm-dist
```

Or to build _and_ push the images:

```sh
goreleaser release --snapshot --rm-dist \
./docker_push
```

For real release:

```sh
goreleaser release --rm-dist
```

Also see [release.yml](.github/workflows/release.yml).
