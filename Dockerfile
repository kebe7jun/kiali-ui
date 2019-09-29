FROM node:10-stretch-slim

WORKDIR /root

COPY package.json /root/package.json
COPY yarn.lock /root/yarn.lock

RUN yarn install --frozen-lockfile

COPY . /root

RUN yarn build:prod

RUN cd build && sed -i 's/<base href=\"\/\"\/>//g' index.html && mv index.html index-kiali.html
