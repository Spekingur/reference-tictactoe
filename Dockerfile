FROM node
MAINTAINER Hreiðar Ólafur Arnarsson
WORKDIR /app
COPY . .
EXPOSE 8080
ENV NODE_PATH .
RUN npm install --silent
CMD ["/bin/bash","./runserver.sh","production"]
