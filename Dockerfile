FROM node:18
WORKDIR /opt
ADD . /opt
RUN npm install -g npm@10.8.2
ENTRYPOINT ["npm" "run" "start"]
