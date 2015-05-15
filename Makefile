SHELL=/bin/bash

default: awesome.pid
	echo 'awesome.restart()' | DISPLAY=:1 awesome-client

awesome.pid: xephyr.pid
	xterm -e 'DISPLAY=:1 awesome -c rc.lua & echo $$! > $@; wait' &
	sleep 1s

xephyr.pid:
	Xephyr -ac -br -noreset -screen 800x600 :1 & echo $$! > $@
	while ! DISPLAY=:1 xset -b 2> /dev/null ; do sleep 1s; echo '[INFO] waiting for xephyr...' ; done
	echo '[INFO] xephyr is up!'

clean:
	if [ -f xephyr.pid ] ; then kill -s 9 `cat xephyr.pid` 2> /dev/null || : ; fi
	if [ -f awesome.pid ] ; then kill -s 9 `cat awesome.pid` 2> /dev/null || : ; fi
	rm -f awesome.pid xephyr.pid
