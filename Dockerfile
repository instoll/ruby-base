FROM ruby:2.3.4
# Debian OS.

RUN apt-get -q update && \
    apt-get -q install -y --no-install-recommends \
      ack-grep \
      apt-transport-https \
      bash \
      build-essential \
      cron \
      curl \
      git \
      g++ \
      libsqlite3-dev \
      libxml2-dev \
      libxslt-dev \
      mysql-client \
      lsof \
      postgresql-9.4 \
      postgresql-client-9.4 \
      software-properties-common \
      sqlite3 \
      supervisor \
      tree \
      vim \
      wget \
      zlib1g-dev \
      zip && \
    echo "Install NodeJS" && \
      curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
      apt-get install -y nodejs && \
    echo "Install Ruby dependencies" && \
      echo "gem: --no-ri --no-rdoc" > ~/.gemrc && \
      gem install bundler rake && \
      bundle config build.nokogiri --use-system-libraries && \
    echo "Install latest NPM and Yarn" && \
      npm install npm@latest -g && \
      npm install -g yarn && \
    echo "Install Caddy" && \
      cd /tmp && \
      wget -q https://github.com/mholt/caddy/releases/download/v0.8.3/caddy_linux_amd64.tar.gz && \
      tar xfvz caddy_linux_amd64.tar.gz && \
      mv caddy_linux_amd64 /usr/bin/caddy && \
      rm -f caddy_linux_amd64.tar.gz && \
    echo "Install Spy filewatcher" && \
      cd /tmp && \
      wget -q https://github.com/jpillora/spy/releases/download/1.0.1/spy_linux_amd64.gz && \
      gunzip spy_linux_amd64.gz && \
      chmod 0755 spy_linux_amd64 && \
      mv spy_linux_amd64 /usr/bin/spy && \
    echo "Init supervisor" && \
      mkdir -p /etc/supervisor && \
      mkdir -p /var/log/supervisor
