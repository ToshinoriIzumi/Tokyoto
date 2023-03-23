#!/bin/bash
ROOT_DIR=$( cd . | pwd)/..
app_dir=${ROOT_DIR}/app
db_dir=${ROOT_DIR}/.data

docker network create --driver bridge app_network
docker run --rm -d -p 3000:3000 -p 3035:3035 -v ${app_dir}:/home/rails/app -v tokyo_gem_volume:/home/rails/.rbenv/versions/2.7.6 --net=app_network -h app -e RAILS_SERVE_STATIC_FILES=true -it --name rails_web rails_web /bin/bash
docker run --rm -d -v ${db_dir}:/var/lib/postgresql/data --net=app_network -h db --name rails_db rails_db
docker run --rm -d -p 80:80 --net=app_network -h web -it --name web_server web_server /bin/bash