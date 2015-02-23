# Copyright 2011 The Apache Software Foundation
# 
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Set Hadoop-specific environment variables here.

# The only required environment variable is JAVA_HOME.  All others are
# optional.  When running a distributed configuration it is best to
# set JAVA_HOME in this file, so that it is correctly defined on
# remote nodes.

# The java implementation to use.
export JAVA_HOME=/usr/java/latest
#export JAVA_HOME=/grid/0/jdk

# The jsvc implementation to use. Jsvc is required to run secure datanodes.
export JSVC_HOME=/apache/jsvc

export HADOOP_HOME=/apache/hadoop
#export HADOOP_CONF_DIR=${HADOOP_CONF_DIR:-"/etc/hadoop"}
export HADOOP_CONF_DIR=${HADOOP_HOME}/etc/hadoop

# Extra Java CLASSPATH elements.  Automatically insert capacity-scheduler.
#for f in $HADOOP_HOME/contrib/capacity-scheduler/*.jar; do
#  if [ "$HADOOP_CLASSPATH" ]; then
#    export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:$f
#  else
#    export HADOOP_CLASSPATH=$f
#  fi
#done
#export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:/home/gs/sid/hadoopCurrent/lib/native/*
export HADOOP_CLASSPATH=/apache/hbase/lib/*.jar:$HADOOP_CLASSPATH

# The maximum amount of heap to use, in MB. Default is 1000.
export HADOOP_HEAPSIZE=4000
#export HADOOP_NAMENODE_INIT_HEAPSIZE=""

# Extra Java runtime options.  Empty by default.
#export HADOOP_OPTS="-Djava.net.preferIPv4Stack=true -server $HADOOP_CLIENT_OPTS -Djava.library.path=/home/gs/sid/hadoopCurrent/lib/native/"
export HADOOP_OPTS="-server -Dlog4j.configuration=log4j.properties -Dcom.sun.management.jmxremote.authenticate=true -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.password.file=$HADOOP_CONF_DIR/jmxremote.password $HADOOP_OPTS"
# Command specific options appended to HADOOP_OPTS when specified
export HADOOP_NAMENODE_OPTS="-Xms56g -Xmx56g -XX:MaxNewSize=6g -XX:NewSize=6g -Dcom.sun.management.jmxremote $HADOOP_NAMENODE_OPTS -Dcom.sun.management.jmxremote.port=8004 -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+HeapDumpOnOutOfMemoryError -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:CMSInitiatingOccupancyFraction=85 -XX:+UseCMSCompactAtFullCollection -Xloggc:/var/log/hadoop/hadoop/hadoop-gc-namenode.log -XX:ErrorFile=/var/log/hadoop/hadoop/hadoop-namenode-hs_err_pid.log"
export HADOOP_SECONDARYNAMENODE_OPTS="-Xms56g -Xmx56g -XX:MaxNewSize=6g -XX:NewSize=6g -Dcom.sun.management.jmxremote $HADOOP_SECONDARYNAMENODE_OPTS -Dcom.sun.management.jmxremote.port=8005 -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+HeapDumpOnOutOfMemoryError -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:CMSInitiatingOccupancyFraction=85 -XX:+UseCMSCompactAtFullCollection -Xloggc:/var/log/hadoop/hadoop/hadoop-gc-secondarynamenode.log"
export HADOOP_DATANODE_OPTS="-Dcom.sun.management.jmxremote $HADOOP_DATANODE_OPTS -Dcom.sun.management.jmxremote.port=8006 -Xmx1536m -Xms1536m"
export HADOOP_BALANCER_OPTS="-Dcom.sun.management.jmxremote $HADOOP_BALANCER_OPTS -Dcom.sun.management.jmxremote.port=8007"

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/gs/sid/hadoopCurrent/lib/native

# The following applies to multiple commands (fs, dfs, fsck, distcp etc)
export HADOOP_CLIENT_OPTS="-Xms384m -Xmx2048m $HADOOP_CLIENT_OPTS"
#HADOOP_JAVA_PLATFORM_OPTS="-XX:-UsePerfData $HADOOP_JAVA_PLATFORM_OPTS"

# On secure datanodes, user to run the datanode as after dropping privileges
export HADOOP_SECURE_DN_USER=hadoop

# Where log files are stored.  $HADOOP_HOME/logs by default.
export HADOOP_LOG_DIR=${HADOOP_HOME}/logs
#export HADOOP_LOG_DIR=/grid/0/hadoop/$USER/logs
export YARN_LOG_DIR=${HADOOP_HOME}/logs
#export HADOOP_PID_DIR=/grid/0/hadoop/$USER/pid

#export HADOOP_ROOT_LOGGER=INFO,DRFA
#export YARN_ROOT_LOGGER=INFO,DRFA

# Where log files are stored in the secure data environment.
export HADOOP_SECURE_DN_LOG_DIR=${HADOOP_LOG_DIR}

# The directory where pid files are stored. /tmp by default.
# NOTE: this should be set to a directory that can only be written to by 
#       the user that will run the hadoop daemons.  Otherwise there is the
#       potential for a symlink attack.
export HADOOP_PID_DIR=${HADOOP_HOME}/pids
export HADOOP_SECURE_DN_PID_DIR=${HADOOP_PID_DIR}

# A string representing this instance of hadoop. $USER by default.
export HADOOP_IDENT_STRING=hadoop
