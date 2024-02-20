FROM ubuntu:20.04
ARG RELEASE
ARG LAUNCHPAD_BUILD_ARCH
LABEL org.opencontainers.image.ref.name=ubuntu
LABEL org.opencontainers.image.version=20.04
CMD ["/bin/bash"]
RUN getent group kibana || groupadd --gid 1000 kibana
RUN useradd --uid 1000 --gid 1000 -G 0 --create-home kibana
ADD --chown=kibana:kibana entrypoint.sh /tmp
RUN chmod +x /tmp/entrypoint.sh
EXPOSE 5601:5601/tcp
# Update package lists and install required dependencies
RUN apt-get update && \
    apt-get install -y curl build-essential libssl-dev
USER kibana
SHELL ["/bin/bash", "--login", "-c"]
# Install NVM
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh >> /tmp/install_nvm.sh && \
    bash /tmp/install_nvm.sh && \
    rm /tmp/install_nvm.sh && \
    source ~/.profile && \
    nvm install 18.18.2 && \
    nvm alias default 18.18.2 && \
    npm install -g yarn && \
    echo 'export PATH="$PATH:/home/kibana/.nvm/versions/node/v18.18.2/bin"' >> ~/.profile && \
    source ~/.profile
USER kibana
WORKDIR /usr/share/kibana
# Set the installed Node.js version as the default