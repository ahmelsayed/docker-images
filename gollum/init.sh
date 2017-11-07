#!/bin/sh

if [ ! -d /home/site/wwwroot/.git ]; then
  git init /home/site/wwwroot
fi

gollum --config /etc/gollum/config.rb --port 80
