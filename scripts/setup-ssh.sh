#!/bin/bash
# http://linux.about.com/od/Bash_Scripting_Solutions/a/How-To-Pass-Arguments-To-A-Bash-Script.htm
# http://stackoverflow.com/questions/169511/how-do-i-iterate-over-a-range-of-numbers-defined-by-variables-in-bash
# http://www.cyberciti.biz/faq/bash-for-loop/
# https://docs.vagrantup.com/v2/provisioning/shell.html
# http://www.cyberciti.biz/faq/bash-prepend-text-lines-to-file/
source "/vagrant/scripts/common.sh"
TOTAL_NODES=2

while getopts t: option
do
	case "${option}"
	in
		t) TOTAL_NODES=${OPTARG};;
	esac
done

function setupHosts {
	mkdir -p ~/.ssh
	ssh-keygen -f ~/.ssh/id_rsa -t rsa -P ""
	cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

	echo "copy ssh key "
	for i in $(seq 1 $TOTAL_NODES)
	do 
		sshpass -p 'vagrant' ssh-copy-id -i ~/.ssh/id_rsa.pub node${i}
	done
}


echo "setup ssh"
setupHosts