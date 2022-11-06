#!/bin/bash

# system update
apt update

# create user for later
useradd -m Hacksore

# native deps for brew
apt install -y curl git default-jre

# install yarn
npm i -g yarn

# add firebase tools
yarn global add firebase-tools vercel

touch /root/test.file

# done
echo "Container has been setup 🚀"