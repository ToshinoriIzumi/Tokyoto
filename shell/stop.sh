#!/bin/bash

docker stop rails_web
docker stop rails_db
docker stop react_web
docker network rm app_network