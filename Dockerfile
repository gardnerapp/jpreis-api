FROM ruby:3.0.2-bullseye as builder
RUN  apt-get update && apt-get install -y npm && npm install -g yarnRUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir -p /var/appCOPY . /var/app
WORKDIR /var/app
RUN bundle install
CMD rails db:migrate && rails db:seed
CMD rails s -b 0.0.0.0

