#!/bin/bash 


echo "stop regionservers"
/usr/bin/ansible -i /var/lib/ansible/hadoop-ansible/hosts/nox slavenodes -m command -a "svc -d /service/hbase-regionserver" -f 20 
sleep 1

echo "stop tasktrackers"
/usr/bin/ansible -i /var/lib/ansible/hadoop-ansible/hosts/nox slavenodes -m command -a "svc -d /service/tasktracker" -f 20 
sleep 1

echo "stop datanodes"
/usr/bin/ansible -i /var/lib/ansible/hadoop-ansible/hosts/nox slavenodes -m command -a "svc -d /service/datanode" -f 20 
sleep 1

echo "stop hbase master"
ssh nox-srw-hbm-1.vip.ebay.com "svc -d /service/hbase-master" 

echo "stop zookeepers"
sleep 1
for i in 1 2 3 
do
	ssh nox-srw-zk-$i.vip.ebay.com "svc -d /service/zookeeper"
done

echo "stop jobtracker"
sleep 1
ssh nox-srw-jt.vip.ebay.com "svc -d /service/jobtracker" 

echo "stop namenode"
sleep 1
ssh nox-srw-nn.vip.ebay.com "svc -d /service/namenode" 


