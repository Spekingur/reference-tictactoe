FROM node
MAINTAINER Hreiðar Ólafur Arnarsson
WORKDIR /app
COPY . .
EXPOSE 80
ENV NODE_PATH .
RUN npm install --silent
CMD ["./runserver.sh"]
