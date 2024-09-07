#! /bin/bash
sudo pacman -Syu --noconfirm
yay --save --answerdiff None --answerclean None
yay --noconfirm -S visual-studio-code-bin python-pip vapoursynth-tools-genstubs-git qt5-wayland qt6-wayland github-desktop-bin

# Export vscode as app on the host
distrobox-export -a code -ef "--enable-features=UseOzonePlatform --ozone-platform-hint=auto"

# Install python stuff
pip install --user vsjet vsmuxtools vodesfunc
printf 'export PATH=$PATH:$HOME/.local/bin' >> $HOME/.bash_profile
printf 'fix-vs=chmod -R u+x ~/scripts/ && ~/scripts/fix-vs.sh' >> $HOME/.bash_profile

vsgenstubs4
