#!/bin/bash

#
# package install 
#
if [ "$(uname)" = "Linux" ]; then
  # apt install
  sudo apt-get update
  sudo apt-get install -y \
  zsh \
  alacritty \
  git \
  build-essential \
  libssl-dev \
  libxcb1-dev \
  libxcb-render0-dev \
  libxcb-shape0-dev \
  libxcb-xfixes0-dev \
  libharfbuzz-dev \
  libfontconfig1-dev \
  libfreetype-dev \
  libexpat1-dev \
  pkg-config
fi

# change shell
if [ "$SHELL" != "$(which zsh)" ]; then
  if [ "$CI" = "true" ]; then
    sudo chsh -s $(which zsh) $USER
  else
    echo "Changing shell to zsh..."
    sudo chsh -s $(which zsh)
  fi
fi

# starship install
curl -sS https://starship.rs/install.sh | sh -s -- --yes

# rust install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# cargo binstall install
curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash

# cargo install
cargo binstall --no-confirm zellij sheldon eza bat fd-find ripgrep git-delta broot silicon zoxide

# zellij install
cargo install --git https://github.com/bvaisvil/zenith.git

#
# font install
#

# 一時的な作業ディレクトリを作成して移動
WORK_DIR="/tmp/hackgen_install"
mkdir -p "$WORK_DIR"
cd "$WORK_DIR"

# HackGen v2.10.0 (Nerd Font版) のZIPをダウンロード
wget https://github.com/yuru7/HackGen/releases/download/v2.10.0/HackGen_NF_v2.10.0.zip

# ZIPファイルを展開
unzip HackGen_NF_v2.10.0.zip

# ユーザー個別のフォントディレクトリを作成
FONT_DIR="$HOME/.local/share/fonts/HackGenNF"
mkdir -p "$FONT_DIR"

# .ttf ファイル（フォント本体）を展開先からフォントディレクトリに移動
sudo mv HackGen_NF_v2.10.0/*.ttf "$FONT_DIR/"

echo "フォントファイルを $FONT_DIR にインストールしました。"

# フォントキャッシュの削除
fc-cache -fv

# sheldon plugin install
if command -v sheldon &> /dev/null; then
  echo "Runnning sheldon lock..."
  sheldon lock
else
  echo "Warning; sheldon not found."
fi
