##########################################################################
# Base image begin
##########################################################################
# This is the default base image
FROM ubuntu:18.04

##########################################################################
# Base image end
##########################################################################



##########################################################################
# ENV VAR begin
##########################################################################
# ARG RAILS_ENV=development
ENV DEBIAN_FRONTEND noninteractive
##########################################################################
# ENV VAR end
##########################################################################



##########################################################################
# Install core dependencies begin
##########################################################################
RUN apt-get update 
RUN apt-get -y upgrade
RUN apt-get -y dist-upgrade

RUN apt-get install -y \
    sudo wget curl htop ntp nano unzip git-core 
RUN apt-get install -y \
    nodejs npm nginx
##########################################################################
# Install core dependencies end
##########################################################################


##########################################################################
# Install ubuntu dependencies begin
##########################################################################

##########################################################################
# Install ubuntu dependencies end
##########################################################################



##########################################################################
# Setup app dependencies begin
##########################################################################
# set current dir
WORKDIR /app/ABT-front
ENV PWD /app/ABT-front

# copy src code
COPY package.json package.json
COPY yarn.lock yarn.lock

# bundle
RUN npm install yarn -g
RUN yarn install
##########################################################################
# Setup app dependencies end
##########################################################################



##########################################################################
# Starting commands begin
##########################################################################
# start null service
CMD ["tail", "-f", "/dev/null"]

# start web service
# CMD ["rails", "s", "-p", "3000"]
##########################################################################
# Starting commands end
##########################################################################

