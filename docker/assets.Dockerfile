FROM node:21 AS assets

WORKDIR /node

COPY package.json yarn.lock ./
COPY package.json yarn.lock ./

RUN yarn install --check-files

#COPY . ./
RUN mkdir -p app/javascript && \
    mkdir -p app/assets

CMD [ "node" ]