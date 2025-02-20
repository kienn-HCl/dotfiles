# macbookに関するメモ書き
## macの起動時の音
該当するefiブート変数を書き換えることで設定を変えられる。

### 消音化
```bash
# ファイルに変更不可属性がついていたので書き込む前に変更できるようにする。
$ sudo chattr -i /sys/firmware/efi/efivars/SystemAudioVolume-7c436110-ab2a-4bbb-a880-fe41995c9f82
$ printf "\x07\x00\x00\x00\x00" | sudo tee /sys/firmware/efi/efivars/SystemAudioVolume-7c436110-ab2a-4bbb-a880-fe41995c9f82
$ sudo chattr +i /sys/firmware/efi/efivars/SystemAudioVolume-7c436110-ab2a-4bbb-a880-fe41995c9f82
```

### 書き換える前の値
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
