FROM node:alpine

LABEL author="AFS205"

WORKDIR /var/www/AFS205

COPY ./package.json .
COPY ./package-lock.json .

ENV NODE_ENV production
RUN npm install -g pm2@latest
RUN npm install

COPY    . .

RUN mkdir -p /var/log/pm2

EXPOSE 		8080

ENTRYPOINT ["pm2", "start", "server.js","--name","AFS205","--log","/var/log/pm2/pm2.log","--watch","--no-daemon"]


# To build:
# docker build -f docker-node-AFS205.dockerfile --tag AFS205_node ../

# To run:
# docker run -d -p 8080:8080 -v $(PWD):/var/www/AFS205 -w /var/www/AFS205 AFS205_node
# docker run -d -p 8080:8080 --name AFS205_node AFS205_node 
