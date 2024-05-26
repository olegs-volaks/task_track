FROM ruby:3.3.1

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs gcc musl-dev make libaio1 && \
    apt-get clean -qq -y

RUN gem install bundler

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle check || bundle install

RUN mkdir -p docker

COPY ./docker/docker-entrypoint.sh ./docker/docker-entrypoint.sh

ENTRYPOINT ["./docker/docker-entrypoint.sh"]

EXPOSE 3000
CMD ["rails", "server", "-p", "3000", "-b", "0.0.0.0"]
