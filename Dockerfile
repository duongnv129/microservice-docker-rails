FROM ruby:2.3.0

ENV MICROSERVICE_GIT_URL https://github.com/nguyenduong127/microservice-docker-rails.git

ENV MICROSERVICE_GIT_BRANCH development

RUN apt-get update -qq && apt-get install -y build-essential libmysqlclient-dev

# Make ssh dir
RUN mkdir /root/.ssh/

# Copy over private key, and set permissions
# ADD id_rsa /Users/duong/.ssh/id_rsa

# Create known_hosts
# RUN touch /root/.ssh/known_hosts

# Add github (or your git server) fingerprint to known hosts
# RUN ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts

RUN mkdir /microservice

# Git clone
RUN set -x \
    && git clone ${MICROSERVICE_GIT_URL} --branch ${MICROSERVICE_GIT_BRANCH} --single-branch --depth=1 /microservice

WORKDIR /microservice

ADD Gemfile /microservice/Gemfile

ADD Gemfile.lock /microservice/Gemfile.lock

RUN bundle install

ADD . /microservice

