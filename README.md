# dotfile
主にNix(とその仕組みを使って`/home/$USER`以下を管理するhome-manager)を使ってセットアップしている。

## セットアップの手順の概要
1. Nixのインストール
2. home-managerのインストール

> [!NOTE]
> `~/.ssh/`以下に鍵を準備しておくなどして、githubとやり取りできることが望ましい。

## 1. Nix
### install
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix > nix-installer.sh
# nix-installer.shの中身がおかしくないか軽く確認しとくと良い
cat nix-installer.sh | sh -s -- install
```
> [!WARN]
> 最初にdeterminate systemが手を加えたNixをインストールするか聞かれる。
> これをNoと入力することで公式のNixがインストールされる。こちらをおすすめする。

### reference
[Get Nix running on your system](https://zero-to-nix.com/start/install/)



## 2. Home Manager
### install
[1. Nix](#1-nix)にある方法でNixが導入されていることが前提。
> [!NOTE]
>[1. Nix](#1-nix)以外の方法だとflakesが有効化されていない可能性があるので適宜設定すること。
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

## Trouble
- "program '/nix/var/determinate/post-build-hook.sh' failed with exit code 1" とうエラーが出てHome Managerがインストールできない
2025-02-17時点での`nix-installer.sh`(おそらくv0.36.4)におそらく問題がある。
`/nix/nix-installer uninstall`でアンインストール後、以前成功したv0.34.0の`nix-installer.sh`(ref. [releases v0.34.0](https://github.com/DeterminateSystems/nix-installer/releases/tag/v0.34.0))を試したところエラーは出なくなった。


## macbookに関するメモ書き
### macの起動時の音
該当するefiブート変数を書き換えることで設定を変えられる。

#### 消音化
```bash
# ファイルに変更不可属性がついていたので書き込む前に変更できるようにする。
$ sudo chattr -i /sys/firmware/efi/efivars/SystemAudioVolume-7c436110-ab2a-4bbb-a880-fe41995c9f82
$ printf "\x07\x00\x00\x00\x00" | sudo tee /sys/firmware/efi/efivars/SystemAudioVolume-7c436110-ab2a-4bbb-a880-fe41995c9f82
$ sudo chattr +i /sys/firmware/efi/efivars/SystemAudioVolume-7c436110-ab2a-4bbb-a880-fe41995c9f82
```

#### 書き換える前の値
念の為書き換える前(音がなる)の値を残しておく。
```bash
$ efivar -n 7c436110-ab2a-4bbb-a880-fe41995c9f82-SystemAudioVolume
GUID: 7c436110-ab2a-4bbb-a880-fe41995c9f82
Name: "SystemAudioVolume"
Attributes:
	Non-Volatile
	Boot Service Access
	Runtime Service Access
Value:
00000000  77                                                |w               |
```
