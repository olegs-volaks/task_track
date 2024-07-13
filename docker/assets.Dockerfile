FROM node:22.4.0-slim

ARG UID
ARG GID

RUN groupmod -g $GID node \
    && usermod -u $UID node

WORKDIR /node

RUN mkdir -p app/javascript && \
    mkdir -p app/assets && \
    mkdir -p app/node_modules

RUN chown -R node:node /node

USER node

CMD [ "node" ]