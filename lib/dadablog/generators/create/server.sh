#!/bin/bash

ret=`git init .`
regexp=".*empty.*"
if [[ $ret =~ $regexp ]]; then
    echo "git add ."
    x=`git add .`

    echo "git commit -m 'init'"
    x=`git commit -m 'init'`
fi

DESC="web server"

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