# dotfile
主にNix(とその仕組みを使って`/home/$USER`以下を管理するhome-manager)を使ってセットアップしている。

## セットアップの手順の概要
1. Nixのインストール
2. home-managerのインストール

> [!NOTE]
> `~/.ssh/`以下に鍵を準備しておくなどして、githubとやり取りできることが望ましい。

## Nix
### install
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix > nix-installer.sh
# nix-installer.shの中身がおかしくないか軽く確認しとくと良い
cat nix-installer.sh | sh -s -- install
```
### reference
[Get Nix running on your system](https://zero-to-nix.com/start/install/)



## Home Manager
### install
[Nix](##nix)にある方法でNixが導入されていることが前提。
> [!NOTE]
>[Nix](##nix)以外の方法だとflakesが有効化されていない可能性があるので適宜設定すること。
```bash
git clone git@github.com:kienn-HCl/dotfiles.git ~/.config/home-manager
nix run home-manager/master -- init --switch --impure
```
`.bashrc`などのhome-managerで管理するファイル・ディレクトリがすでにある場合、エラーとなるので`-b`オプションでファイルのバックアップを取るようにするとよい。
```bash
nix run home-manager/master -- init --switch --impure -b backup
```

### update
```bash
home-manager switch --impure
```

### reference
[Home Manager Manual](https://nix-community.github.io/home-manager/index.xhtml#sec-flakes-standalone)
