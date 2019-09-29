FROM node:10-stretch-slim

COPY package.json /tmp/package.json
COPY yarn.lock /tmp/yarn.lock

WORKDIR /tmp

RUN yarn install --frozen-lockfile \
    && mv /tmp/node_modules /root/

WORKDIR /root

COPY . /root

RUN yarn build

RUN cd dist && sed -i 's/<base href=\"\/\"\/>//g' index.html && mv index.html index-kiali.html
