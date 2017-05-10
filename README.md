Hadoop Vagrant Config
============================================================

This repo contains the Vagrantfile script for generating virtual machines of Hadoop and Spark.


Installation
==========================================
1. Install Vagrant for your specific operating system

2. Clone this repository

3. Open the Vagrantfile script using your favourite IDE and change the config as you need. The specific configuration can be found in the next part of this document.

4. From your console/terminal, inside the main directory, run the vagrant with following command and wait until it finishes.

vagrant up

5. Once it is finished, enter the node1 machine by following command

vagrant ssh node1

6. After it enters the shell of node1, run the script for configuring password-less SSH to slave nodes by executing following commands

sudo chmod +x /vagrant/scripts/setup-ssh.sh

/vagrant/script/setup-ssh.sh -t [n]

where [n] is amount of node you would like to setup in cluster

Configuration
=============================================

Following option can be configured in the Vagrant file

1. --memory

To spcifiy the memory for each machine

2. numNodes

To specify the amount of nodes in cluster

