FROM ubuntu:20.04

RUN useradd -m -s /bin/bash react_user
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y && \
    apt install -y vim git autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdm-dev curl libpq-dev wget language-pack-ja-base language-pack-ja locales htop chromium-chromedriver libsqlite3-dev lsof redis-server python make g++ && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt -y install nodejs && \
    locale-gen ja_JP.UTF-8 && \
    apt update -y &&\
    npm install -g yarn

USER react_user
SHELL [ "/bin/bash", "-c" ]
WORKDIR /home/react_user/app

# CMD cd /home/react_user/app/tokyoto_app && npm start