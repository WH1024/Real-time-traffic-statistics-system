#!/bin/bash
# hadoop\zookeeper\flume\kafka\hbase

app_base=/home/hadoop/app

# start hadoop hdfs and yarn
process_all=('NameNode' 'SecondaryNameNode' 'DataNode' 'ResourceManager' 'NodeManager')
## echo ${process_all[@]}

for process_name in ${process_all[@]}
    do
        process_survival=`ps -ef | grep $process_name|grep -v grep|wc -l`
        if [ $process_survival -le 0 ];then
           echo "$process_name is not run"
           start-all.sh
           break
        else
           echo "$process_name is running"
        fi
    done
# start zookeeper
process_name=QuorumPeerMain
process_survival=`ps -ef | grep $process_name|grep -v grep|wc -l`
if [ $process_survival -le 0 ];then
    echo "$process_name is not run"
    sh $app_base/zookeeper/bin/zkServer.sh start
else
    echo "$process_name is running"
fi

# start hbase
process_name=HMaster
process_survival=`ps -ef | grep $process_name|grep -v grep|wc -l`
if [ $process_survival -le 0 ];then
    echo "$process_name is not run"
    sh $app_base/hbase/bin/start-hbase.sh
else
    echo "$process_name is running"
fi
