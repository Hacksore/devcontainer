FROM ubuntu:latest

WORKDIR /home/

COPY . .

# run setup
RUN bash ./setup.sh