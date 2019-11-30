#!/bin/bash
docker build -t jjino/nginx -f image/prod/Dockerfile ./image/prod
docker build -t jinoj/nginx jjino/radiant
docker push jjino/radiant
kubectl apply -f radiant
# docker build -t jinoj/nginx:latest jjino/radiant:$SHA
kubectl set image deployments/radiant-deployment server=jjino/radiant
