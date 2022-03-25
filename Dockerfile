FROM debian:bullseye-slim

ENV GEM_HOME=/usr/local/bundle
ENV BUNDLE_APP_CONFIG=/usr/local/bundle

RUN apt-get update -qq && apt-get install -y git tig screen vim dialog ruby build-essential postgresql-client build-essential libpq-dev ruby-dev \
                          imagemagick ghostscript \
                       && mkdir -p /usr/local/dotfiles
WORKDIR /usr/src/redmine

COPY redmine.sh /usr/local/bin/
COPY ./dotfiles /usr/local/dotfiles

ARG LOCAL_UID
RUN chmod +x /usr/local/bin/redmine.sh && useradd -u $LOCAL_UID -m user && cp -a /usr/local/dotfiles /home/user/.dotfiles \
                       && chown -R user:user /home/user
USER user

RUN sh /home/user/.dotfiles/init.sh
