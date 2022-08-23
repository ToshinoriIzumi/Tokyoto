# Tokyoto

### アプリ起動方法
1. フォルダの移動
    - cd ./shell
2. 環境の構築(初めに実行、または環境が更新された場合に利用)
    - bash build.sh
3. ボリュームの作成(初めに実行)
    - bash create_volume.sh
4. Dockerコンテナの起動
    - bash run.sh

### アプリ停止方法
1. フォルダの移動
    - cd ./shell
2. Dockerコンテナの停止
    - bash ./stop.sh