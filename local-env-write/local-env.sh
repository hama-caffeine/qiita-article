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
