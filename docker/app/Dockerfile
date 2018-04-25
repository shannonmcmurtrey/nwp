# Use the barebones version of Ruby 2.4.1.
FROM ruby:2.4.1-slim
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs 
# Configuring main directory
RUN mkdir -p /nwp
WORKDIR /nwp 
# Setting env up
ENV RAILS_ENV='production'
ENV RAKE_ENV='production' 
# Adding gems
COPY Gemfile /nwp/Gemfile
#COPY Gemfile.lock /nwp/Gemfile.lock
RUN bundle install --jobs 20 --retry 5 --without development test 
# Adding project files
COPY . /nwp
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]