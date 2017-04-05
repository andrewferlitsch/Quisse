# Using Docker to recreate the Quisse development environment
# Last updated: April 5, 2017
# Author: ctwhittle@gmail.com

## Setup
1.  Install Docker (https://hub.docker.com)
2.  Create project directory
3.  Create src subdirectory
4.  cd to src subdirectory
5.  Checkout github repository: https://github.com/andrewferlitsch/Quisse
6.  Copy contents of src/Docker directory to project root
7.  cd to project root
7.  run: docker build -f quisse.docker -t quisse/nginx .
8.  run: docker build -f quisse-php.docker -t nmcteam/php56 .
9.  run: docker run --name mysql -e MYSQL_ROOT_PASSWORD=pa88=w0rd -d mysql:latest

## Running environment
docker-compose -f quisse.docker-compose.yml up -d
Connect to Quisse usingin URL: http://localhost:8080/

## Usefile commands

# Attached running container
docker exec -it <CONTAINER ID> /bin/bash

# View Docker log files
docker-compose -f quisse.docker-compose.yml logs

