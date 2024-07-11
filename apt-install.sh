# apt
sudo apt update
sudo apt-get install eza bat hexyl fd-find ripgrep vim zsh git

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

cargo install procs starship --locked

# setup
chsh -s /bin/zsh
source ~/.zshrc
