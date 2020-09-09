# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
export JAVA_HOME=/home/hadoop/app/java
export PATH=$JAVA_HOME/bin:$PATH

export FLUME_HOME=/home/hadoop/app/flume
export PATH=$FLUME_HOME/bin:$PATH

export HADOOP_HOME=/home/hadoop/app/hadoop
export PATH=$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH

export KAFKA_HOME=/home/hadoop/app/kafka
export PATH=$KAFKA_HOME/bin:$PATH

export ZK_HOME=/home/hadoop/app/zookeeper
export PATH=$ZK_HOME/bin:$PATH

export HBASE_HOME=/home/hadoop/app/hbase
export PATH=$HBASE_HOME/bin:$PATH


export MAVEN_HOME=/home/hadoop/app/maven
export PATH=$MAVEN_HOME/bin:$PATH

export SCALA_HOME=/home/hadoop/app/scala
export PATH=$SCALA_HOME/bin:$PATH

export SPARK_HOME=/home/hadoop/app/spark
export PATH=$SPARK_HOME/bin:$PATH

export IDEA_HOME=/home/hadoop/app/idea-IU-193.6494.35
export PATH=$IDEA_HOME/bin:$PATH
