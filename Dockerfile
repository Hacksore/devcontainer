FROM mcr.microsoft.com/vscode/devcontainers/base:bullseye

WORKDIR /root

COPY setup.sh .

USER root

# run setup
RUN bash /root/setup.sh