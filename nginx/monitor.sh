#!/usr/bin/sh
#* * * * * sh /home/forge/abtworld/nginx/monitor.sh
cd /home/forge/abtworld/nginx

nginx_pid=`ps -ef | grep 'nginx: master process' | grep -v grep | awk '{ print $2}'`
if [ ${#nginx_pid} -eq 0 ]
then
    echo `date` >> ./nginx_monitor.log
    /usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf >> ./nginx_monitor.log 2>&1 &
    echo -e "\n" >> ./nginx_monitor.log
fi
