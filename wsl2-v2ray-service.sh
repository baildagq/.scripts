#!/bin/sh
set -e

# create for wsl2, which only have service, no systemctl
# need download v2ray-linux-64 into /opt/ and soft link to V2RAY_COMMAND

### BEGIN INIT INFO
# Provides:           v2ray
# Required-Start:     $syslog $remote_fs
# Required-Stop:      $syslog $remote_fs
# Should-Start:       cgroupfs-mount cgroup-lite
# Should-Stop:        cgroupfs-mount cgroup-lite
# Default-Start:      2 3 4 5
# Default-Stop:       0 1 6
# Short-Description:  start proxy server.
# Description:
#  v2rary is proxy tools
### END INIT INFO

export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin


# This is the pid file created/managed by start-stop-daemon
BASE="v2ray"
V2RAY_COMMAND="/usr/local/bin/v2ray"
V2RAY_SSD_PIDFILE=/var/run/$BASE-ssd.pid
V2RAY_LOGFILE=/var/log/$BASE.log
V2RAY_DESC="v2ray"

# Get lsb functions
. /lib/lsb/init-functions

if [ -f /etc/default/$BASE ]; then
	. /etc/default/$BASE
fi


check_init() {
	# see also init_is_upstart in /lib/lsb/init-functions (which isn't available in Ubuntu 12.04, or we'd use it directly)
	if [ -x /sbin/initctl ] && /sbin/initctl version 2>/dev/null | grep -q upstart; then
		log_failure_msg "$V2RAY_DESC is managed via upstart, try using service $BASE $1"
		exit 1
	fi
}

fail_unless_root() {
	if [ "$(id -u)" != '0' ]; then
		log_failure_msg "$V2RAY_DESC must be run as root"
		exit 1
	fi
}

case "$1" in
	start)
		check_init
		
		fail_unless_root

        touch "$V2RAY_LOGFILE"

		log_begin_msg "Starting $V2RAY_DESC: $BASE"
		start-stop-daemon --start --background \
			--no-close \
			--exec "$V2RAY_COMMAND" \
			--pidfile "$V2RAY_SSD_PIDFILE" \
			--make-pidfile >> "$V2RAY_LOGFILE" 2>&1
		log_end_msg $?
		;;

	stop)
		check_init
		fail_unless_root
		if [ -f "$V2RAY_SSD_PIDFILE" ]; then
			log_begin_msg "Stopping $V2RAY_DESC: $BASE"
			start-stop-daemon --stop --pidfile "$V2RAY_SSD_PIDFILE" --retry 10
			log_end_msg $?
		else
			log_warning_msg "V2RAY already stopped - file $V2RAY_SSD_PIDFILE not found."
		fi
		;;

	restart)
		check_init
		fail_unless_root
		pid=`cat "$V2RAY_SSD_PIDFILE" 2>/dev/null`
		[ -n "$pid" ] \
			&& ps -p $pid > /dev/null 2>&1 \
			&& $0 stop
		$0 start
		;;

	force-reload)
		check_init
		fail_unless_root
		$0 restart
		;;

	status)
		check_init
		status_of_proc -p "$V2RAY_SSD_PIDFILE" "$V2RAY_DESC" "$V2RAY_DESC"
		;;

	*)
		echo "Usage: service v2ray {start|stop|restart|status}"
		exit 1
		;;
esac
