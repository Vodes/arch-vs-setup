#! /bin/bash
sudo pacman -Syu --noconfirm
yay --save --answerdiff None --answerclean All
yay --noconfirm -S visual-studio-code-bin python-pip vapoursynth-tools-genstubs-git qt5-wayland qt6-wayland
yay --noconfirm -R visual-studio-code-bin-debug
yay --noconfirm -S github-desktop-bin
yay --noconfirm -R github-desktop-bin-debug

# Export vscode as app on the host
distrobox-export -a code -ef "--enable-features=UseOzonePlatform --ozone-platform-hint=auto"

# Install python stuff
pip install --user vsjet vsmuxtools vodesfunc
printf '\nexport PATH=$PATH:$HOME/.local/bin' >> $HOME/.bash_profile
source $HOME/.bash_profile

vsgenstubs4
