FROM archlinux:latest

ENV PIP_BREAK_SYSTEM_PACKAGES=1

RUN pacman -Syu --noconfirm && pacman -S --noconfirm base-devel git wget
RUN mkdir -p /tmp/yay-build && useradd -m -G wheel builder && passwd -d builder && chown -R builder:builder /tmp/yay-build && echo 'builder ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN su - builder -c "git clone https://aur.archlinux.org/yay.git /tmp/yay-build/yay"
RUN su - builder -c "cd /tmp/yay-build/yay && makepkg -si --noconfirm"
RUN rm -rf /tmp/yay-build && userdel -f builder
RUN sudo pacman -S --noconfirm mediainfo mkvtoolnix-cli vapoursynth ffmpeg
