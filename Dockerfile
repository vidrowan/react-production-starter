FROM mhart/alpine-node:4.3.1

EXPOSE 80
EXPOSE 5000

VOLUME /src
WORKDIR /src

ADD . .
RUN npm install

#CMD ["npm", "run", "start:prod"]
