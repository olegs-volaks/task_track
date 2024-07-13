FROM ruby:3.3.4-slim

ARG UID
ARG GID

ENV HOME /home/rails/

RUN groupadd -g $GID rails && \
    useradd -m -d $HOME -u $UID -g $GID rails

RUN chown -R rails:rails $HOME

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev gcc musl-dev make libaio1 curl -y -q --no-install-recommends && \
    apt-get clean -qq -y

ENV NVM_DIR /opt/nvm

RUN mkdir -p $NVM_DIR

ENV NODE_VERSION 22.4.0

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default \
    && npm install --global yarn

RUN gem install bundler

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle check || bundle install

RUN mkdir -p docker

COPY ./docker/docker-entrypoint.sh ./docker/docker-entrypoint.sh

ENTRYPOINT ["./docker/docker-entrypoint.sh"]

RUN mkdir -p node_modules \
    && chown -R rails:rails /app

USER rails

EXPOSE 3000
CMD ["rails", "server", "-p", "3000", "-b", "0.0.0.0"]
