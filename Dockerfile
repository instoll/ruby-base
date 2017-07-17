FROM ruby:2.3.4
# Debian OS.

RUN apt-get -q update && \
    apt-get -q install -y --no-install-recommends \
      ack-grep \
      bash \
      build-essential \
      cron \
      curl \
      git \
      g++ \
      libsqlite3-dev \
      nodejs \
      sqlite3 \
      supervisor \
      tree \
      vim \
      wget \
      zlib1g-dev \
      zip && \
    echo "Install Caddy" && \
    cd /tmp && \
    wget -q https://github.com/mholt/caddy/releases/download/v0.8.3/caddy_linux_amd64.tar.gz && \
    tar xfvz caddy_linux_amd64.tar.gz && \
    mv caddy_linux_amd64 /usr/bin/caddy && \
    rm -f caddy_linux_amd64.tar.gz && \
    echo "Install Spy filewatcher" && \
    cd /tmp && \
    wget -q https://github.com/jpillora/spy/releases/download/1.0.1/spy_1.0.1_linux_amd64.tar.gz && \
    tar xzf spy_1.0.1_linux_amd64.tar.gz && \
    mv spy_1.0.1_linux_amd64/spy /usr/bin && \
    rm -Rf spy_1.0.1_linux_amd64* && \
    echo "Init supervisor" && \
    mkdir -p /etc/supervisor && \
    mkdir -p /var/log/supervisor