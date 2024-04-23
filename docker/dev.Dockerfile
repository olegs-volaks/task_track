FROM ruby:3.3.0

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs gcc musl-dev make libaio1

#RUN ln -s /usr/lib/x86_64-linux-musl/libc.so /lib/libc.musl-x86_64.so.1

RUN gem install bundler

WORKDIR /app

COPY Gemfile Gemfile.lock ./

#RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

#COPY package.json yarn.lock ./

#RUN yarn install --check-files

#COPY . ./

CMD ["./docker/docker-entrypoint.sh"]