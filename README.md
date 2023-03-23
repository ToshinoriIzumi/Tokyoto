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

### Railsサーバーの起動方法
1. Dockerコンテナに入る。
    - docker exec -it rails_web /bin/bash
2. ディレクトリを移動する。
    - cd ./tokyoto_app
3. JSのライブラリを追加する。
    - npm install
4. Railsサーバーの起動
    - bin/rails db:create
    - bin/rails db:migrate
    - bin/rails db:seed
    - bin/rails s -b 0.0.0.0

### GoogleマップAPIの利用方法
#### ここから下の処理は、Macで行う。(Docker内ではない。)
1. 設定ファイルを作成する。
    - cp app/tokyoto_app/app/javascript/packs/map/hospitals/config/const.js.sample app/tokyoto_app/app/javascript/packs/map/hospitals/config/const.js
2. GoogleMapsApiKeyを取得する。
    - 下記を参照にGoogleMapsApiKeyを作成する。
        - https://developers.google.com/maps/documentation/javascript/cloud-setup
        - https://developers.google.com/maps/documentation/javascript/get-api-key
3. コピーした設定ファイルのexport const GOOGLE_MAP_API_KEY = '作成したキー'になるように記載する。

### アプリ停止方法
1. フォルダの移動
    - cd ./shell
2. Dockerコンテナの停止
    - bash ./stop.sh
