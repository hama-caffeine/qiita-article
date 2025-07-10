ごくごくたまに記事を書こうかと思い立つことがあるのですが、本題以前のところでちとめんどくさいなと思っているところがあります。

何かというと、ローカルの環境を書くのに、いつも迷いながら書いていて、それをめんどくさいなあ、と感じていました。

そこで、自分の中だけでもフォーマット化してしまおうかと考えました。

## そもそも、なぜローカル環境を書かなければならないか？

端的には再現性と前提を整えるためと考えています。

再現性というのは自分が書いたコードが意図したとおりに動いてくれる環境を示す、というのがあります。

前提というのも同じ意味合いではありますが、もし、試してくれた人の環境でなにか不都合があったときに、それが環境が違うことによるものなのか、それとも、完全に意図しないところが悪さしてしまっているのかなどを見分けるのに役立つというのもあるかとおもいます。


## じゃあ、何を書くか

あたりまえのことですが、利用した言語のバージョンが必要になります。

それこそ、

```python:hallo.py
print("hallo world")
```

なんてのは、使っている人には「pythonかな？」なんてのはすぐにわかるかとおもいます。

しかし、
```python:zoneinfo.py
import zoneinfo
import datetime

dt = datetime.datetime(2025, 7, 9, tzinfo=zoneinfo.ZoneInfo("America/Los_Angeles"))
print(dt)
```
というコードは、pythonのバージョンを書いておいてあげないと動かない場合があります。
※zoneinfoはPython3.9以降から利用可能

試してくれた人が「動かないよー」とレスポンスしてくれても、書いた人の手元では動く。それでなんでだなんでだとやっていってやっとのことバージョン違いにたどり着くなんてのは時間と手数の無駄だったりします。

そういう行き違いを避けたり、前提を整えたりという意味合いでもローカル環境を書くのが求められます。


## どうやって書くか

次のような内容をササッと共有するのが良いのかと思いました。

```sh:local-env.sh
# /usr/bin/sh
set -x              # 実行したコマンドを出力

# OSやハードウェア
cat /etc/os-release # ディストリビューション情報
uname -a            # カーネルのバージョンやビルド情報
uname -m            # CPUアーキテクチャ

# 言語
python3 --version
node -v

# pythonのパッケージ一覧
pip3 list

# pythonのパッケージ
pip3 show boto3


# Node.jsのパッケージ一覧
npm ls -g

# Node.jsのパッケージ
npm ls -g @google/gemini-cli
```
それぞれ、記事で扱う内容によって不要なものや冗長なものもあると思いますが、いったんはこれで雛形になるんじゃないかと思いました。


上記のshを動かすとターミナル上に結果が出るんで、適度にかいつまんで掲載するのが良いのかと考えました。
私の環境で出力されたのを元に整形すると次のようになります。

```bash
$ cat /etc/os-release
PRETTY_NAME="Debian GNU/Linux 12 (bookworm)"

$ uname -a
Linux penguin 6.6.76-08024-gb30cb4a129c2 #1 SMP PREEMPT_DYNAMIC Fri, 25 Apr 2025 05:08:33 -0700 x86_64 GNU/Linux

$ uname -m
x86_64

$ python3 --version
Python 3.11.2

$ node -v
v24.3.0

$ pip3 list
Package                  Version
------------------------ -----------
boto3                    1.34.127
botocore                 1.34.127

$ pip3 show boto3
Name: boto3
Version: 1.34.127

$ npm ls -g
/home/hama/.config/nvm/versions/node/v24.3.0/lib
├── @google/gemini-cli@0.1.7
└── npm@11.4.2

$ npm ls -g @google/gemini-cli
/home/hama/.config/nvm/versions/node/v24.3.0/lib
└── @google/gemini-cli@0.1.7
```

※`local-env.sh`は https://github.com/hama-caffeine/qiita-article/blob/1e83ca0706b61b90114cf2ecf2b86b5c3f393798/local-env-write/local-env.sh にあります


## あとは書くだけ！

ひとまず、少しは書くためのハードルが下げられたかと思うんで、書きます（たぶん）。

