#!/bin/sh

if [ "$HADOOP_HOME" == "" ]; then
  echo "Cannot find hadoop installation: \$HADOOP_HOME must be set";
  exit 1;
fi

HADOOP_CONF_DIR=$HADOOP_HOME/conf
HADOOP_LZO_JAR=`ls $HADOOP_HOME/lib/hadoop-lzo*.jar`
QUEUE=`$HADOOP_HOME/bin/hadoop queue -showacls|tail -1|awk '{print $1}'`

export PIG_CLASSPATH=$HADOOP_CONF_DIR:$HADOOP_LZO_JAR:$PIG_CONF_DIR:$PIG_CLASSPATH
export PIG_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native/Linux-amd64-64 -Dmapred.job.queue.name=$QUEUE"
