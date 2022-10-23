FROM mcr.microsoft.com/vscode/devcontainers/base:bullseye

WORKDIR /root

COPY . .

USER root

# run setup
RUN bash /root/setup.sh