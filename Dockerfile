# ベースとなるPythonイメージを指定
FROM python:3.11-slim

# 環境変数設定（Pythonの出力をバッファしないように）
ENV PYTHONUNBUFFERED=1

# 作業ディレクトリを設定
WORKDIR /app

# 依存関係ファイルをコンテナ内にコピー
COPY requirements.txt /app/

# 依存関係をインストール
RUN pip install --no-cache-dir -r requirements.txt

# プロジェクト全体をコピー
COPY . /app/

# サーバ起動コマンド
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]