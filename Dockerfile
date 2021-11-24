# use ruby 3 as base image
FROM ruby:3.0.2-bullseye as builder

# install dependencies
RUN apt-get update && apt-get install -y npm && npm install -g yarn
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir -p /var/app
COPY . /var/app
WORKDIR /var/app

RUN bundle install

CMD rails s -b 0.0.0.0

