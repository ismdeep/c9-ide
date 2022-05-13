FROM ubuntu:18.04

MAINTAINER ismdeep <ismdeep@protonmail.com>

ADD https://nodejs.org/dist/v12.18.4/node-v12.18.4-linux-x64.tar.xz /opt
ADD ./entrypoint.bash /entrypoint.bash
RUN set -eux; \
    chmod +x /entrypoint.bash; \
    apt-get update -y; \
    apt-get install -y apt-utils xz-utils wget curl git python2.7 make gcc locales; \
    locale-gen en_US.UTF-8; \
    cd /opt; \
    xz -d node-v12.18.4-linux-x64.tar.xz; \
    tar -xvf node-v12.18.4-linux-x64.tar; \
    rm node-v12.18.4-linux-x64.tar; \
    git clone https://github.com/c9/core.git c9sdk; \
    cd /opt/c9sdk; \
    PATH=$PATH:/opt/node-v12.18.4-linux-x64/bin bash ./scripts/install-sdk.sh
EXPOSE 80
WORKDIR /workspace
ENTRYPOINT ["/entrypoint.bash"]