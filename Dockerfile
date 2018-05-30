FROM dariksde/ubuntu-baseimage

MAINTAINER Daniel Rippen <rippendaniel@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git build-essential libuecc-dev libsodium-dev bison pkg-config libcap-dev libjson-c-dev libssl-dev cmake wget

RUN wget https://git.rippen-ks.de/ffks-uniks/ffks-testing-nodes-keys/raw/master/.drone/setup-fastd.sh -O /tmp/setup-fastd.sh && \
    bash /tmp/setup-fastd.sh

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*
