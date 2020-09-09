#!/bin/bash
# hadoop\zookeeper\hbase

app_base=/home/hadoop/app

# stop hbase
process_name=HRegionServer
process_survival=`ps -ef | grep $process_name|grep -v grep|wc -l`
if [ $process_survival -le 0 ];then
    echo "$process_name is not run"
else
   sh $app_base/hbase/bin/stop-hbase.sh
fi
# stop zookeeper
process_name=QuorumPeerMain
process_survival=`ps -ef | grep $process_name|grep -v grep|wc -l`
if [ $process_survival -le 0 ];then
    echo "$process_name is not run"
else
    sh $app_base/zookeeper/bin/zkServer.sh stop
fi
# stop hadoop hdfs and yarn
process_all=('NameNode' 'SecondaryNameNode' 'DataNode' 'ResourceManager' 'NodeManager')
## echo ${process_all[@]}
for process_name in ${process_all[@]}
    do
        process_survival=`ps -ef | grep $process_name|grep -v grep|wc -l`
        if [ $process_survival -le 0 ];then
           echo "$process_name is not run"
        else
           stop-all.sh
        fi
    done
