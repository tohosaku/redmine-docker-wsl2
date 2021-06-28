FROM ruby:2.7-slim-buster
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y curl gnupg gosu git imagemagick ghostscript
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs yarn postgresql-client build-essential libpq-dev
WORKDIR /usr/src/redmine
COPY entrypoint.sh redmine.sh webpack.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh && chmod +x /usr/local/bin/redmine.sh && chmod +x /usr/local/bin/webpack.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
