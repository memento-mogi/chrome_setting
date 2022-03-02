#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

# Install google-chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Install fonts
sudo apt install task-japanese locales-all fonts-ipafont -y
sudo localectl set-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"
source /etc/default/locale

# Install mozc
sudo apt install fcitx-mozc -y

# Set environment variable
sudo chmod a+w /etc/systemd/user/cros-garcon.service.d/cros-garcon-override.conf
sudo echo 'Environment="GTK_IM_MODULE=fcitx"' >> /etc/systemd/user/cros-garcon.service.d/cros-garcon-override.conf
sudo echo 'Environment="QT_IM_MODULE=fcitx"' >> /etc/systemd/user/cros-garcon.service.d/cros-garcon-override.conf
sudo echo 'Environment="XMODIFIERS=@im=fcitx"' >> /etc/systemd/user/cros-garcon.service.d/cros-garcon-override.conf

# Automation
sudo echo '/usr/bin/fcitx-autostart' >> ~/.sommelierrc

sudo reboot

