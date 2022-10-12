#!/usr/bin/env bash

set -eEuo pipefail

if [ -z "${CONTAINER_REGISTRY:-}" ]; then
  echo "✋ Missing CONTAINER_REGISTRY!" >&2
fi

docker image push --all-tags ${CONTAINER_REGISTRY}/goreleaser-play-foo
# Add other images built by the goreleaser here.
