# Gum is used for the Omakub commands for tailoring Omakub after the initial install
cd /tmp
source ~/.local/share/omakub/get_arch.sh
ARCH=$(get_arch)
GUM_VERSION="0.14.1" # Use known good version
wget -qO gum.deb "https://github.com/charmbracelet/gum/releases/latest/download/gum_${GUM_VERSION}_${ARCH}.deb"
sudo apt-get install -y ./gum.deb
rm gum.deb
cd -
