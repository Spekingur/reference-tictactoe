FROM node                                               # The base image we are going to use
MAINTAINER Hreiðar Ólafur Arnarsson                     # Mah name
WORKDIR /app                                            # The working directory for the built app in the image
COPY . .                                                # Moving all files from the build directory to the working directory
EXPOSE 8080                                             # The port the container will listen to
ENV NODE_PATH .                                         # Setting the node path to current directory
RUN npm install --silent                                # Installing of npm is necessary (--silent doesn't work)
CMD ["/bin/bash","./runserver.sh","production"]         # Default execution of container
