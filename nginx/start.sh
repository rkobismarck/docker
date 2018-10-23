#!/bin/bash

if [ "$1" != "" ]; then
    echo "Image name for the container."
    echo $1
else
    echo "No name was supplied, please verify that you've assigned a valid name for your image."
    exit
fi

if [ "$2" != "" ]; then
    echo "Plaase assign a valid port number for the container."
    echo $2
else
    echo "No port name was supplied, please verify that you've assigned a valid port number for your image."
    exit
fi

echo "Hello, we're going to deploy our Docker instances like containers."
echo "Let's start Dockerizing!!!"

echo "If a container is running with the previous image built in, we're going to stop the container."
docker stop $(docker ps -q --filter ancestor=$1 )

echo "Building the newest Image"
docker build -t $1 .

echo "Running the Docker Image in a Container"
docker run -d -p $2:80 $1

echo "Up & Running"
