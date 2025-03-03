FROM node:18
WORKDIR /opt
ADD . /opt
RUN npm install -g npm@latest
ENTRYPOINT ["npm" "run" "start"]
