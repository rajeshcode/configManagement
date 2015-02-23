# Set Hadoop-specific environment variables here.

# The only required environment variable is JAVA_HOME.  All others are
# optional.  When running a distributed configuration it is best to
# set JAVA_HOME in this file, so that it is correctly defined on
# remote nodes.

# The java implementation to use.  Required.
# export JAVA_HOME=/usr/lib/j2sdk1.5-sun
export JAVA_HOME=/usr/java/latest

# Extra Java CLASSPATH elements.  Optional.
#export HADOOP_CLASSPATH=/apache/hbase/lib/*:$HADOOP_CLASSPATH

# The maximum amount of heap to use, in MB. Default is 1000.
# export HADOOP_HEAPSIZE=2000
export HADOOP_HEAPSIZE=600


# Extra Java runtime options.  Empty by default.
# export HADOOP_OPTS=-server
##
export HADOOP_OPTS="-server -Dlog4j.configuration=log4j.properties -Dcom.sun.management.jmxremote.authenticate=true -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.password.file=$HADOOP_CONF_DIR/jmxremote.password"

# Command specific options appended to HADOOP_OPTS when specified
export HADOOP_NAMENODE_OPTS="-Xmx10g -Dcom.sun.management.jmxremote $HADOOP_NAMENODE_OPTS -Dcom.sun.management.jmxremote.port=8004 -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+HeapDumpOnOutOfMemoryError -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:CMSInitiatingOccupancyFraction=85 -XX:+UseCMSCompactAtFullCollection -Xloggc:/var/log/hadoop/hadoop/hadoop-gc-namenode.log -XX:ErrorFile=/var/log/hadoop/hadoop/hadoop-namenode-hs_err_pid.log"
export HADOOP_SECONDARYNAMENODE_OPTS="-Xmx10g -Dcom.sun.management.jmxremote $HADOOP_SECONDARYNAMENODE_OPTS -Dcom.sun.management.jmxremote.port=8005"
export HADOOP_DATANODE_OPTS="-Dcom.sun.management.jmxremote $HADOOP_DATANODE_OPTS -Dcom.sun.management.jmxremote.port=8006"
export HADOOP_BALANCER_OPTS="-Dcom.sun.management.jmxremote $HADOOP_BALANCER_OPTS -Dcom.sun.management.jmxremote.port=8007"
export HADOOP_JOBTRACKER_OPTS="-Xmx10g -Dcom.sun.management.jmxremote $HADOOP_JOBTRACKER_OPTS -Dcom.sun.management.jmxremote.port=8008 -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+HeapDumpOnOutOfMemoryError -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:CMSInitiatingOccupancyFraction=85 -XX:+UseCMSCompactAtFullCollection -Xloggc:/var/log/hadoop/hadoop/hadoop-gc-jobtracker.log -XX:ErrorFile=/var/log/hadoop/hadoop/hadoop-jobtracker-hs_err_pid.log"
export HADOOP_TASKTRACKER_OPTS="-Dcom.sun.management.jmxremote.port=8009 $HADOOP_TASKTRACKER_OPTS"



#
# export HADOOP_TASKTRACKER_OPTS=
# The following applies to multiple commands (fs, dfs, fsck, distcp etc)
# export HADOOP_CLIENT_OPTS

# Extra ssh options.  Empty by default.
# export HADOOP_SSH_OPTS="-o ConnectTimeout=1 -o SendEnv=HADOOP_CONF_DIR"
export HADOOP_SSH_OPTS="-o SendEnv=HADOOP_CONF_DIR -o SendEnv=HADOOP_LOG_DIR -o SendEnv=HADOOP_PID_DIR"

# Where log files are stored.  $HADOOP_HOME/logs by default.
# export HADOOP_LOG_DIR=${HADOOP_HOME}/logs
### export HADOOP_LOG_DIR=${HADOOP_HOME}/logs

# File naming remote slave hosts.  $HADOOP_HOME/conf/slaves by default.
# export HADOOP_SLAVES=${HADOOP_HOME}/conf/slaves

# host:path where hadoop code should be rsync'd from.  Unset by default.
# export HADOOP_MASTER=master:/home/$USER/src/hadoop

# Seconds to sleep between slave commands.  Unset by default.  This
# can be useful in large clusters, where, e.g., slave rsyncs can
# otherwise arrive faster than the master can service them.
# export HADOOP_SLAVE_SLEEP=0.1

# The directory where pid files are stored. /tmp by default.
# export HADOOP_PID_DIR=/var/hadoop/pids
#export HADOOP_PID_DIR=/home/hadoop/latest/pids
export HADOOP_PID_DIR=$HADOOP_HOME/pids

# A string representing this instance of hadoop. $USER by default.
# export HADOOP_IDENT_STRING=$USER

# The scheduling priority for daemon processes.  See 'man nice'.
# export HADOOP_NICENESS=10

#The user who owns the datanode in a secure mode. The too user starts up the jsvc process and then switches to the specified user
export HADOOP_SECURE_DN_USER=hadoop
export HADOOP_SECURE_DN_PID_DIR=$HADOOP_PID_DIR
