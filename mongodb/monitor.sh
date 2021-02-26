#!/usr/bin/sh
#* * * * * sh /home/forge/abtworld/mongodb/monitor.sh
cd /home/forge/abtworld/mongodb

mongod_pid=`ps -ef | grep 'mongod -f' | grep -v grep | awk '{ print $2}'`
if [ ${#mongod_pid} -eq 0 ]
then
    echo `date` >> ./mongod_monitor.log
    nohup /usr/bin/mongod -f /etc/mongod.conf >> ./mongod_monitor.log 2>&1 &
    echo -e "\n" >> ./mongod_monitor.log
fi
