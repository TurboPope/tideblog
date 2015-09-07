#!/bin/sh
# tideblog Starts and stops tideblog
#
#
# chkconfig: - 85 15
# description: Tideblog is my jekyll-based blog
# processname: tideblog
# pidfile: /var/run/tideblog.pid

# Configure your values here
SOURCE=/home/mbrack/tideblog
DEST=/home/mbrack/tideblog

# Generally, shouldn't need to change below here...
PID_FILE=/var/run/tideblog.pid
LOG_FILE=/var/log/tideblog.log
JEKYLL_EXE=/usr/local/bin/jekyll

case "$1" in
start)
        $JEKYLL_EXE $SOURCE $DEST >> $LOG_FILE &
        echo $! > $PID_FILE
        echo "tideblog STARTED"
        exit 0
;;

stop)
        kill -TERM $(cat $PID_FILE)
        echo "tideblog STOPPED"
        exit 0
;;

restart)
        $0 stop
        $0 start
        exit 0
;;

status)
        ps -p `cat $PID_FILE` > /dev/null 2>&1 && echo "tideblog Running" || echo "tideblog Not Running"
;;

*)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
esac
