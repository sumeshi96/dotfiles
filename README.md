# dotfiles

## セットアップ
### 前提
- ssh -T git@github.comが成功していること
### chezmoiのインストールとセットアップ
`sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin" init --ssh --apply sumeshi96`

## chezmoiの使いかた
- ソースディレクトリへの移動
`chezmoi cd`
- 管理対象の追加
`chezmoi add <file name>`
- 編集
`chezmoi edit <file name>`
- ローカルの変更の適用
`chezmoi apply`
- リモートの変更の適用
`chezmoi update`

## docs
### インストールするもの
- chezmoi(dotfile管理)
- zsh(シェル)
- alacritty(ターミナル)
- git
- starship(プロンプト)
- rust
- cargo binstall
  - zellij(ターミナルマルチプレクサ)
  - sheldon(zshのプラグインマネージャ)
  - eza(ls)
  - bat(cat)
  - fd-find(find)
  - git-delta(gitの差分表示)
  - broot(tree)
  - silicon(コードの画像化)
  - zoxide(ディレクトリ走査)
- zenith(top)
- font(HackGen Console NF)

