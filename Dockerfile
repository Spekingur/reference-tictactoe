# The base image we are going to use
FROM node
# Mah name
MAINTAINER Hreiðar Ólafur Arnarsson
# The working directory for the built app in the image
WORKDIR /app
# Moving all files from the build directory to the working directory
COPY . .
# The port the container will listen to
EXPOSE 8080
# Setting the node path to current directory
ENV NODE_PATH .
# Installing of npm is necessary (--silent doesn't work)
RUN npm install --silent
# Default execution of container
CMD ["/bin/bash","./runserver.sh","production"]
