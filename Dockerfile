FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    unzip \
    zip \
    git \
    curl \
    gnupg2

RUN curl -sL https://deb.nodesource.com/setup_10.x | -E bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y nodejs yarn
