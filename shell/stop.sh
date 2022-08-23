#!/bin/bash

docker stop rails_web
docker stop rails_db
docker network rm app_network