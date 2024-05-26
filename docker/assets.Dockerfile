FROM node:22-alpine

WORKDIR /node

COPY package.json yarn.lock ./

RUN yarn install --check-files

RUN mkdir -p app/javascript && \
    mkdir -p app/assets

CMD [ "node" ]