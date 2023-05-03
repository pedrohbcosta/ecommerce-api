FROM ruby:2.7.1
RUN apt-get update -qq && apt-get install -y --no-install-recommends build-essential apt-utils ghostscript
RUN apt-get update -qq && apt-get install -y libssl-dev libpq-dev postgresql-client 
RUN gem install bundler -v 2.1.4
RUN mkdir /ecommerce_api
WORKDIR /ecommerce_api
COPY Gemfile /ecommerce_api/Gemfile
COPY Gemfile.lock /ecommerce_api/Gemfile.lock
RUN bundle install
COPY . /ecommerce_api


# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]