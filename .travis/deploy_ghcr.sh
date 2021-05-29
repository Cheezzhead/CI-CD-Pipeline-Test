echo "$DOCKER_PASS" | docker login ghcr.io -u "$DOCKER_USER" --password-stdin
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t ghcr.io/${TRAVIS_REPO_SLUG,,}:${TAG,,} .
docker push ${TRAVIS_REPO_SLUG,,}:${TAG,,}