FROM ruby:2.3.0

ENV MICROSERVICE_GIT_URL https://github.com/nguyenduong127/microservice-docker-rails.git

ENV MICROSERVICE_GIT_BRANCH development

RUN apt-get update -qq && apt-get install -y build-essential libmysqlclient-dev

RUN mkdir /microservice

WORKDIR /microservice

ADD Gemfile /microservice/Gemfile

ADD Gemfile.lock /microservice/Gemfile.lock

RUN bundle install

ADD . /microservice

