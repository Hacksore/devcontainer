FROM ubuntu:latest

WORKDIR /home

COPY . .

USER root

# run setup
RUN bash ./setup.sh