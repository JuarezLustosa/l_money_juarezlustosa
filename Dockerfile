FROM ruby:2.7.0

ENV NODE_VERSION 10

RUN apt-get update -qq
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash -
RUN apt-get install -y --no-install-recommends nodejs vim
RUN apt-get update
RUN apt-get install -y postgresql-client --fix-missing
RUN apt-get install -y build-essential nodejs \
 && rm -rf /var/lib/apt/lists/* \
 && curl -o- -L https://yarnpkg.com/install.sh | bash

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash \
 && apt-get update && apt-get install -y nodejs && rm -rf /var/lib/apt/lists/* \
 && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update && apt-get install -y yarn && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /juarezlustosa

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
ADD ./package.json /myapp/

RUN gem install bundler
RUN bundle install --path /bundle
RUN yarn install

WORKDIR /juarezlustosa
ADD . /juarezlustosa

RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Brazil/East /etc/localtime
