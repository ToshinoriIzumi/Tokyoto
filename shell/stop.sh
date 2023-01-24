#!/bin/bash

docker stop web_server
docker stop rails_web
docker stop rails_db
docker network rm app_network