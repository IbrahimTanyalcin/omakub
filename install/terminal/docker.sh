if [[ -z $UTILS_SOURCED ]]; then
    source ~/.local/share/omakub/utils.sh
fi
ARCH=$(get_arch "dockercompose")
sudo apt install -y docker.io docker-buildx
sudo usermod -aG docker ${USER}

# Limit log size to avoid running out of disk
echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json

DOCKER_COMPOSE_VERSION="2.27.0"
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
if curl -sSL "https://github.com/docker/compose/releases/download/v$DOCKER_COMPOSE_VERSION/docker-compose-linux-${ARCH}" -o "$DOCKER_CONFIG/cli-plugins/docker-compose"; then
    chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
else 
    false
fi
