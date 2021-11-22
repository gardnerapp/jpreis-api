# use ruby 3 as base image
FROM ruby:3.0.2-bullseye as builder
# install dependencies
RUN apt-get update -qq && apt-get install -y nodejs npm postgresql-client

# create app
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# adds a script to be executed every time the container starts
COPY entrypoint.sh /usr/nom
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# restarts server if already runnning
RUN rm -f /myapp/tmp/pids/server.pid

# Configure main process to run when running the image
CMD ["rails", "s", "-b", "0.0.0.0"]