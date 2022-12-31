FROM nginx:1.15.8

RUN apt update && apt install procps vim procps -y
# インクルード用のディレクトリ内を削除
RUN rm -f /etc/nginx/conf.d/*

# Nginxの設定ファイルをコンテナにコピー
ADD nginx.conf /etc/nginx/conf.d/webapp.conf

# ビルド完了後にNginxを起動
CMD /usr/sbin/nginx -c /etc/nginx/nginx.conf

USER nginx