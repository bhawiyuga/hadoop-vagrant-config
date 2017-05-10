#!/bin/bash
# http://stackoverflow.com/questions/6348902/how-can-i-add-numbers-in-a-bash-script
source "/vagrant/scripts/common.sh"
START=3
TOTAL_NODES=4

while getopts s:t: option
do
	case "${option}"
	in
		s) START=${OPTARG};;
		t) TOTAL_NODES=${OPTARG};;
	esac
done

function setupSlaves {
	echo "modifying $HADOOP_CONF/slaves"
	if fileExists $HADOOP_CONF/slaves; then
		rm $HADOOP_CONF/slaves
	fi
	for i in $(seq $START $TOTAL_NODES)
	do 
		entry="node${i}"
		echo "adding ${entry}"
		echo "${entry}" >> $HADOOP_CONF/slaves
	done
}

echo "setup hadoop slaves"
setupSlaves