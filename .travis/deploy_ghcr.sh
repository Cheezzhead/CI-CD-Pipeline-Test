IMAGE=${TRAVIS_REPO_SLUG,,}
TAG=latest

echo "$DOCKER_PASS" | docker login ghcr.io -u "$DOCKER_USER" --password-stdin
docker build -f Dockerfile -t ghcr.io/${IMAGE}:${TAG}
docker push ghcr.io/${IMAGE}:${TAG}