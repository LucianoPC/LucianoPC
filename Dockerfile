FROM node:slim

RUN mkdir /usr/src/app/
WORKDIR /usr/src/app/

RUN apt-get update
RUN apt-get install -y git --no-install-recommends
RUN rm -rf /var/lib/apt/lists/*

RUN npm install -g bower polymer-cli --unsafe-perm

COPY . /usr/src/app

EXPOSE 8081
CMD bower install --allow-root && polymer serve -H 0.0.0.0
