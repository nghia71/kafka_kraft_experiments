#!/bin/sh

./stop.sh

docker system prune -a
sudo rm -rf vol*/