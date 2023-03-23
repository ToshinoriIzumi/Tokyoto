#!/bin/bash
docker_dir=$( cd . | pwd)/../docker
docker build ${docker_dir}/server -t web_server
docker build ${docker_dir}/app -t rails_web
docker build ${docker_dir}/db -t rails_db
ls