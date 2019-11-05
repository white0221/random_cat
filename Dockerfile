FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /cat_app
WORKDIR /cat_app

ADD ./Gemfile /cat_app
ADD ./Gemfile.lock /cat_app
RUN bundle install
