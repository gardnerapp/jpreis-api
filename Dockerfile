FROM ruby:3.0.2-bullseye as builder
RUN  apt-get update && apt-get install -y npm && npm install -g yarn
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir -p /var/app
COPY . /var/app
WORKDIR /var/app
RUN bundle install
RUN rails db:migrate RAILS_ENV=development && rails db:seed RAILS_ENV=development
CMD rails s -b 0.0.0.0

