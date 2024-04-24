FROM ruby:3.3.0

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs gcc musl-dev make libaio1

RUN gem install bundler

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle check || bundle install

RUN mkdir -p app/javascript

COPY ./docker/docker-entrypoint.sh ./docker/docker-entrypoint.sh

CMD ["./docker/docker-entrypoint.sh"]
