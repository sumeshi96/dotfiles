#!/bin/bash

#
# package install 
#
if [ "$(uname)" = "Linux" ]; then
  # apt install
  $SUDO apt-get update
  $SUDO apt-get install -y \ 
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
  libfreetype6-dev \
  libexpat1-dev \
  pkg-config
fi

# change shell
chsh -s $(which zsh)

# starship install
curl -sS https://starship.rs/install.sh | sh -s -- --yes

# rust install
curl --proto '=httpshttps' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# cargo install
cargo install cargo-binstall
cargo binstall zellij sheldon eza bat fd ripgrep delta broot zenith silicon

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
mv HackGen_NF_v2.10.0/*.ttf "$FONT_DIR/"

echo "フォントファイルを $FONT_DIR にインストールしました。"

# フォントキャッシュの削除
fc-cache -fv
