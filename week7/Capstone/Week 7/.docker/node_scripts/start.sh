#!/bin/bash

if [ -z "$NODE_ENV" ]; then
    export NODE_ENV=development
fi

cd /var/www/AFS205

pm2 start -x server.js --name="AFS205" --no-daemon --watch
