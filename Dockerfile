FROM mcr.microsoft.com/vscode/devcontainers/base:bullseye

WORKDIR /home

COPY . .

USER root

# run setup
RUN bash ./setup.sh

# maybe nice to have?
ENTRYPOINT [ "/usr/local/share/docker-init.sh" ]
CMD [ "sleep", "infinity" ]