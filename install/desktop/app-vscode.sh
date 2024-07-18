cd /tmp
source ~/.local/share/omakub/get_arch.sh
ARCH=$(get_arch "vscode")
if wget -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-${ARCH}"; then
    sudo apt install -y ./code.deb
    rm code.deb

    mkdir -p ~/.config/Code/User
    cp ~/.local/share/omakub/configs/vscode.json ~/.config/Code/User/settings.json

    # Install default supported themes
    code --install-extension enkia.tokyo-night
fi
cd -




