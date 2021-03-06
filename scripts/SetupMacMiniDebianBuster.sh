#!/bin/bash

#	SETUP SCRIPT.
# OS:		Debian 10 Buster.
# Device:	Mid 2011 Mac Mini.

# Give sudo permission to user.
# Go to /etc/sudoers. You'll need root permissions so:
#    su
#    nano /etc/sudoers
# Add the line:
#    %ryan    ALL=(ALL:ALL) ALL
# Save the changes and then run:
#    apt-get update
#    exit
# You're no longer running as root, but should have sudo permission.
# Check this with sudo apt-get update

# Run updates and upgrades.
yes | sudo apt-get update
yes | sudo apt-get upgrade
yes | sudo apt-get update
yes | sudo apt-get dist-upgrade
yes | sudo apt-get full-upgrade
yes | sudo apt-get update

# To add calendars for Microsoft Exchange add evolution-ews. On Buster this is
# available on backports. Add to /etc/apt/sources.list:
echo -e "\n# Needed for evolution-ews." | sudo tee -a /etc/apt/sources.list
echo "deb http://ftp.debian.org/debian buster-backports main" |\
  sudo tee -a /etc/apt/sources.list
echo "deb-src http://ftp.debian.org/debian buster-backports main" |\
  sudo tee -a /etc/apt/sources.list
yes | sudo apt-get update
yes | sudo apt-get install -t buster-backports evolution-ews

# Run the rest of the script in downloads.
cd ~/Downloads

# Install curl and wget for downloading files.
yes | sudo apt-get install wget
yes | sudo apt-get install curl

# Install git for cloing repositories.
yes | sudo apt-get install git
yes | sudo apt-get update

# Update pciids. I forget why I want this, but I think it
# has to do with the wi-fi card.
yes | sudo update-pciids

# We need dkms to run the install script for the Apple Magic Pad drivers.
yes | sudo apt-get install dkms

# Grab the driver repository from GitHub.
git clone https://github.com/rohitpid/Linux-Magic-Trackpad-2-Driver.git

# Change directory into the repository we just cloned.
cd Linux-Magic-Trackpad-2-Driver/scripts

# Give execute permission to the install script and run it.
chmod u+x install.sh
sudo ./install.sh

# Change directory back to downloads.
cd ~/Downloads

# Install GNOME Builder (or VS Code).
yes | sudo apt-get install gnome-builder

# Install signal. These are the comments from signal.

# NOTE: These instructions only work for 64 bit Debian-based
# Linux distributions such as Ubuntu, Mint etc.

# 1. Install our official public software signing key
wget -O- https://updates.signal.org/desktop/apt/keys.asc |\
  sudo apt-key add -

# 2. Add our repository to your list of repositories
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" |\
  sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

# 3. Update your package database and install signal
yes | sudo apt update && sudo apt install signal-desktop

# Install nordvpn.
wget https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
yes | sudo apt-get install ./nordvpn-release_1.0.0_all.deb
yes | sudo apt-get update
yes | sudo apt-get install nordvpn
yes | sudo apt-get update

# Install the NoobsLab flat-remix theme.
wget https://launchpad.net/~noobslab/+archive/ubuntu/themes/+files/flat-remix-gs-theme_3.12-1~xenial~NoobsLab.com_all.deb
yes | sudo apt-get install ./flat-remix-gs-theme_3.12-1~xenial~NoobsLab.com_all.deb

# Install Calibre (book library).
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# Install LaTeX.
yes | sudo apt-get install texlive-full

# Run this in case anything broke.
yes | sudo apt-get --fix-broken install
yes | sudo apt-get autoremove
yes | sudo apt-get clean

# Remove several things that come pre-installed.
yes | sudo apt-get remove --purge mozc-data
yes | sudo apt-get remove --purge hdate-applet
yes | sudo apt-get remove --purge anthy
yes | sudo apt-get remove --purge anthy-common
yes | sudo apt-get remove --purge debian-reference
yes | sudo apt-get remove --purge debian-reference-common
yes | sudo apt-get remove --purge fcitx
yes | sudo apt-get remove --purge fcitx-anthy
yes | sudo apt-get remove --purge fcitx-config-common
yes | sudo apt-get remove --purge fcitx5
yes | sudo apt-get remove --purge fcitx-data
yes | sudo apt-get remove --purge fcitx5-data
yes | sudo apt-get remove --purge goldendict
yes | sudo apt-get remove --purge khmerconverter
yes | sudo apt-get remove --purge mlterm
yes | sudo apt-get remove --purge xiterm+thai
yes | sudo apt-get remove --purge xterm

# Remove dependencies that are no longer needed.
yes | sudo apt-get autoremove

# Optional, remove games from work computer.
yes | sudo apt-get remove --purge aisleriot
yes | sudo apt-get remove --purge gnome-mahjongg
yes | sudo apt-get remove --purge mah-jongg
yes | sudo apt-get remove --purge five-or-more
yes | sudo apt-get remove --purge four-in-a-row
yes | sudo apt-get remove --purge hitori
yes | sudo apt-get remove --purge gnome-klotski
yes | sudo apt-get remove --purge iagno
yes | sudo apt-get remove --purge gnome-mines
yes | sudo apt-get remove --purge mlterm
yes | sudo apt-get remove --purge gnome-music
yes | sudo apt-get remove --purge gnome-nibbles
yes | sudo apt-get remove --purge quadrapassel
yes | sudo apt-get remove --purge gnome-robots
yes | sudo apt-get remove --purge gnome-sudoku
yes | sudo apt-get remove --purge swell-foop
yes | sudo apt-get remove --purge tali
yes | sudo apt-get remove --purge gnome-taquin
yes | sudo apt-get remove --purge gnome-tetravex
yes | sudo apt-get remove --purge lightsoff
yes | sudo apt-get autoremove

# You may want to remove the .deb files in ~/Downloads.
rm -f ~/Downloads/*.deb
yes | sudo apt-get update
cd ~

# MANUAL THINGS.
# Set ctrl+up and ctrl+down to change workspace.
# Go to mouse/touchpad settings and enable tap-to-click.
# Sign into Firefox sync.
# Sign into nordvpn.
# Install pCloud and sync.
# Sign in to signal and sync.
# Set up git password in keyring.
# Add email/Online Accounts. Microsoft and Google are normal.
# Yahoo needs a special two-factor password. Go to:
#    https://login.yahoo.com/account/security/app-passwords
# Set up emails in Evolution and Thunderbird.
# Activate theme in Tweaks app.
# Change desktop background to something cool.
# Move frequently used apps to dock.
# Go to GNOME and set up icon bar and user preferences:
#    Dash-to-Dock
#    Trasnparent OSD
#    Enable user themes.

# Optional.
# Install VLC. Works great. Rhythmbox and GNOME videos are sufficient, however.

# Install Jami. Pretty buggy, couldn't get to work.
# Signal now has voice and video calls, so this is unnecessary.

# These drivers work very well.
# yes | sudo apt-get update
# yes | sudo apt-get install broadcom-sta-common
# yes | sudo apt-get install broadcom-sta-source
# yes | sudo apt-get install broadcom-sta-dkms
# Most likely I'll just use ethernet, so this is unnecessary.

# Remove old kernel files we no longer need.
# uname -r
# dpkg --list 'linux-image*' | grep ^ii

# Remove the older files.
# sudo apt-get remove linux-image-VERSION
# yes | sudo apt-get autoremove

# Finally, update GRUB.
# sudo update-grub

# After removing the old kernel files, you may need to reinstall
# the touch pad drivers. These should still be in Downloads.

# OLD

# Install wifi driver. Go to software app and add non-free repositories.
# This driver is dated. Do not use if wifi is needed. Use the ones above.
# yes | sudo apt-get install firmware-b43-installer

# Fix mac address problem. Go to /etc/NetworkManager/NetworkManager.conf
# Add the lines:
#       [device]
#       wifi.scan-rand-mac-address=no

# Save and run:
# sudo systemctl restart NetworkManager
# /etc/init.d/network-manager restart

# Go to /etc/network/
#       sudo nano interfaces
# Comment out the line:
#       source /etc/network/interfaces.d/*
