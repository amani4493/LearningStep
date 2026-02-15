# LearningStep

このリポジトリは、`Django + MySQL + jQuery` 構成で Web アプリを作るための学習用プロジェクトです。  
ここでは「これまで何をしたか」を初心者向けにメモしています。

## 1. 入れたツール / フレームワーク

- `Python`  
  Django を動かすための本体です（すでにインストール済みでした）。
- `venv`（仮想環境）  
  プロジェクトごとにライブラリを分ける仕組みです。このプロジェクトでは `.venv` を使います。
- `Django 6.0.2`  
  Python の Web フレームワークです。画面、URL、DB連携などをまとめて作れます。
- `mysqlclient 2.2.8`  
  Django から MySQL に接続するためのドライバです。
- `MySQL`（これから接続）  
  アプリのデータを保存するデータベースです。
- `jQuery`（これから利用）  
  フロント側の JavaScript 操作を簡単にするライブラリです。

## 2. 実行したコマンドと用途

以下は今回のセットアップで使った主なコマンドです。

1. 仮想環境の Python で Django をインストール

```powershell
.\.venv\Scripts\python.exe -m pip install django
```

- 何をした？  
  このプロジェクト専用の環境（`.venv`）に Django を追加しました。

2. Django プロジェクト雛形を作成

```powershell
.\.venv\Scripts\python.exe -m django startproject config .
```

- 何をした？  
  Django アプリの基本ファイル（`manage.py`, `config/settings.py` など）を作成しました。

3. MySQL 接続用ライブラリをインストール

```powershell
.\.venv\Scripts\python.exe -m pip install mysqlclient
```

- 何をした？  
  Django が MySQL を使えるようにしました。

4. 設定チェックを実行

```powershell
.\.venv\Scripts\python.exe manage.py check
```

- 何をした？  
  Django の設定に問題がないか確認しました。  
  結果は `System check identified no issues` でした。

## 3. 作成 / 更新されたファイルの説明

- `manage.py`  
  Django の管理コマンドを実行する入口ファイルです。  
  例: `migrate`, `runserver`, `createsuperuser`

- `config/settings.py`  
  Django 全体の設定ファイルです。  
  今回は DB を `MySQL` に変更し、`.env` から接続情報を読むようにしています。

- `config/urls.py`  
  URL と画面処理（ビュー）をつなぐ設定ファイルです。

- `config/asgi.py`, `config/wsgi.py`  
  本番サーバー連携で使う起動設定ファイルです。

- `config/__init__.py`  
  `config` を Python パッケージとして扱うためのファイルです。

- `requirements.txt`  
  必要ライブラリの一覧です。  
  このプロジェクトでは `Django` と `mysqlclient` を記録しています。

- `.env.example`  
  環境変数のサンプルです。  
  新しい環境で `.env` を作る時の見本として使います。

- `.env`  
  ローカル開発用の実際の環境変数ファイルです。  
  `MYSQL_PASSWORD` など実値を入れて使います（Git には上げない）。

- `.gitignore`  
  Git 管理しないファイルを定義します。  
  `.venv` や `.env` を除外して、秘密情報や不要ファイルをコミットしないようにします。

## 4. 次にやること

1. `.env` の MySQL 接続情報を実際の値に変更  
2. MySQL 側で DB を作成（例: `learningstep_db`）  
3. マイグレーション実行

```powershell
.\.venv\Scripts\python.exe manage.py migrate
```

4. 開発サーバー起動

```powershell
.\.venv\Scripts\python.exe manage.py runserver
```
