# apt
sudo apt-get update
sudo apt-get install -y vim zsh git code solaar ca-certificates virtualbox gnupg software-properties-commoni jq

# google-drive-ocamlfuse
#sudo add-apt-repostor ppa:alessandro-strada/ppa

# docker
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu.gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# terraform
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

# ansible
sudo apt-add-repository --yes --update ppa:ansible/ansible

# zoom
wget https://zoom.us/client/latest/zoom_amd64.deb

# vivaldi
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main'

# slack
SLACK_URL=$(curl -s https://slack.com/intl/en-jp/downloads/instructions/ubuntu | grep -oP 'https:\/\/downloads\.slack-edge\.com\/linux_releases\/slack-desktop-[0-9.]+-amd64\.deb')
wget $SLACK_URL -O slack_latest.deb

# apt install
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin terraform ansible vivaldi-stable
sudo apt-get install -y ./zoom_amd64.deb ./slack_latest.deb

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
cargo install procs eza bat hexyl fd-find ripgrep starship zellij --locked

# Alacritty

# zed
https://zed.dev/install.sh | sh


# go
GO_URL=$(curl -s https://golang.org/dl/ | grep -oP 'https://dl.google.com/go/go[0-9.]+.linux-amd64.tar.gz' | head -n 1)
wget $GO_URL -O go_latest.tar.gz
sudo tar -C /usr/local -xzf go_latest.tar.gz

# Node.js
curl https://get.volta.sh | bash
