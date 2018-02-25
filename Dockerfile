FROM node:carbon

WORKDIR /usr/src/app

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5 \
&& echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.6 multiverse" | tee /etc/apt/sources.list.d/mongodb.list \
&& apt-get update \
&& apt-get install -y mongodb-org-shell \
&& apt-get install -y mongodb-org-tools

COPY package*.json ./

RUN npm install

COPY app.js .

CMD [ "node", "app.js" ]