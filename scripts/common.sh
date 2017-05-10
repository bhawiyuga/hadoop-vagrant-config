#!/bin/bash

#java
JAVA_ARCHIVE=jdk-7u76-linux-x64.tar.gz
#ant
ANT_ARCHIVE=apache-ant-1.9.6-bin.zip
ANT_MIRROR_DOWNLOAD=http://archive.apache.org/dist/ant/binaries/$ANT_ARCHIVE
#maven
MAVEN_ARCHIVE=apache-maven-3.3.9-bin.zip
MAVEN_MIRROR_DOWNLOAD=http://apache.mirror.iweb.ca/maven/maven-3/3.3.9/binaries/$MAVEN_ARCHIVE
#ssh
SSH_RES_DIR=/vagrant/resources/ssh
RES_SSH_COPYID_ORIGINAL=$SSH_RES_DIR/ssh-copy-id.original
RES_SSH_COPYID_MODIFIED=$SSH_RES_DIR/ssh-copy-id.modified
RES_SSH_CONFIG=$SSH_RES_DIR/config
#hadoop
HADOOP_PREFIX=/usr/local/hadoop
HADOOP_CONF=$HADOOP_PREFIX/etc/hadoop
HADOOP_VERSION=hadoop-2.7.1
HADOOP_ARCHIVE=$HADOOP_VERSION.tar.gz
HADOOP_MIRROR_DOWNLOAD=http://www.apache.org/dist/hadoop/core/hadoop-2.7.1/$HADOOP_ARCHIVE
HADOOP_RES_DIR=/vagrant/resources/hadoop
#zookeeper
ZOOKEEPER_PREFIX=/usr/local/zookeeper
ZOOKEEPER_CONF=$ZOOKEEPER_PREFIX/conf
ZOOKEEPER_VERSION=zookeeper-3.4.6
ZOOKEEPER_ARCHIVE=$ZOOKEEPER_VERSION.tar.gz
ZOOKEEPER_MIRROR_DOWNLOAD=http://apache.mirror.rafal.ca/zookeeper/stable/$ZOOKEEPER_ARCHIVE
ZOOKEEPER_RES_DIR=/vagrant/resources/zookeeper
#scala
SCALA_VERSION=scala-2.11.6
SCALA_ARCHIVE=$SCALA_VERSION.tgz
SCALA_MIRROR_DOWNLOAD=http://www.scala-lang.org/files/archive/$SCALA_ARCHIVE
SCALA_RES_DIR=/vagrant/resources/scala
#rJava
RJAVA_VERSION=rJava_0.9-6
RJAVA_ARCHIVE=$RJAVA_VERSION.tar.gz
#spark
SPARK_VERSION=spark-2.1.1-bin-hadoop2.7
SPARK_ARCHIVE=$SPARK_VERSION.tgz
SPARK_MIRROR_DOWNLOAD=http://d3kbcqa49mib13.cloudfront.net/$SPARK_ARCHIVE
SPARK_RES_DIR=/vagrant/resources/spark
SPARK_CONF=/usr/local/$SPARK_VERSION/conf
#sparkR
SPARKR_ARCHIVE=sparkr.zip
SPARKR_RES_DIR=/vagrant/resources/sparkr
#slider
SLIDER_PREFIX=/usr/local/slider
SLIDER_CONF=$SLIDER_PREFIX/conf
SLIDER_VERSION=slider-0.60.0-incubating
SLIDER_ARCHIVE=$SLIDER_VERSION-all.zip
SLIDER_RES_DIR=/vagrant/resources/slider
SLIDER_HBASE_ARCHIVE=slider-hbase-app-package-1.0.1.1-bin.zip
SLIDER_MEMCACHED_ARCHIVE=jmemcached-1.0.0.zip
SLIDER_OPENLAVA_ARCHIVE=openlava-2.2.zip
#hbase
HBASE_PREFIX=/usr/local/hbase
HBASE_CONF=$HBASE_PREFIX/conf
HBASE_VERSION=hbase-1.1.2 
HBASE_ARCHIVE=$HBASE_VERSION-bin.tar.gz
HBASE_MIRROR_DOWNLOAD=http://archive.apache.org/dist/hbase/1.1.2/$HBASE_ARCHIVE
HBASE_RES_DIR=/vagrant/resources/hbase
#logstash 
LOGSTASH_ARCHIVE=logstash-2.1.1.tar.gz
LOGSTASH_MIRROR_DOWNLOAD=https://download.elastic.co/logstash/logstash/$LOGSTASH_ARCHIVE
LOGSTASH_VERSION=logstash-2.1.1
#elasticsearch 
ELASTICSEARCH_ARCHIVE=elasticsearch-2.1.0.tar.gz
ELASTICSEARCH_MIRROR_DOWNLOAD=https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.1.0/$ELASTICSEARCH_ARCHIVE
ELASTICSEARCH_VERSION=elasticsearch-2.1.0
#kibana 
KIBANA_ARCHIVE=kibana-4.3.0-linux-x64.tar.gz
KIBANA_MIRROR_DOWNLOAD=https://download.elastic.co/kibana/kibana/$KIBANA_ARCHIVE
KIBANA_VERSION=kibana-4.3.0-linux-x64

function resourceExists {
	FILE=/vagrant/resources/$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

function fileExists {
	FILE=$1
	if [ -e $FILE ]
	then
		return 0
	else
		return 1
	fi
}

#echo "common loaded"
