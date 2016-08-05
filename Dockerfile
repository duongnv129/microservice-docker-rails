FROM ruby:2.3.0

RUN apt-get update -qq && apt-get install -y build-essential libmysqlclient-dev

RUN mkdir /microservice

WORKDIR /microservice

ADD Gemfile /microservice/Gemfile

ADD Gemfile.lock /microservice/Gemfile.lock

RUN bundle install

ADD . /microservice

