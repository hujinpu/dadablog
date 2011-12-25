#!/bin/bash

if [ ! -d ".git" ]; then
    echo "git init ."
    x=`git init .`

    echo "git add ."
    x=`git add .`

    echo "git commit -m 'init'"
    x=`git commit -m 'init'`
fi

if [ ! -d "logs" ]; then
    mkdir "logs"
fi

DESC="web server, and welcome using dadablog!"

case "$1" in
    start)
        echo "Starting $DESC."
        rackup
        ;;

    stop)
        echo "Stopping $DESC."
        cat rack.pid | xargs kill
        ;;

    restart)
        echo "First, stopping $DESC."
        cat rack.pid | xargs kill
        echo "And then, starting $DESC."
        rackup
        ;;

esac

exit 0
