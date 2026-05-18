#!/bin/bash

set -euo pipefail

DOCKER_USER="${DOCKER_USER:-valennzarat}"
IMAGE_NAME="devops-portfolio"
TAG="${1:-1.0}"

FULL_TAG="$DOCKER_USER/$IMAGE_NAME:$TAG"

APP_DIR="$(cd "$(dirname "$0")/../app" && pwd)"

log() {
  echo "[$(date '+%H:%M:%S')] $1"
}

log "=== Build ==="

docker build \
  -t "$FULL_TAG" \
  -t "$DOCKER_USER/$IMAGE_NAME:latest" \
  "$APP_DIR"

log "=== Verificando ==="

docker images "$DOCKER_USER/$IMAGE_NAME"

log "=== Test contenedor ==="

docker run --rm -d --name test-ci -p 9999:5000 "$FULL_TAG"

sleep 3

STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:9999/health)

if [ "$STATUS" = "200" ]; then
  log "Health check OK"
else
  log "Health check FAIL"
  docker stop test-ci
  exit 1
fi

docker stop test-ci

log "=== Finalizado ==="
