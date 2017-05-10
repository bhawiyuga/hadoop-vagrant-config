#!/bin/bash
source "/vagrant/scripts/common.sh"

function installLocalJava {
	FILE=/vagrant/resources/$JAVA_ARCHIVE
	tar -xzf $FILE -C /usr/local
}

function setupJava {
	echo "setting up java"
	ln -s /usr/local/jdk1.7.0_76 /usr/local/java
	ln -s /usr/local/java/bin/java /usr/bin/java
	ln -s /usr/local/java/bin/javac /usr/bin/javac
	ln -s /usr/local/java/bin/jar /usr/bin/jar
	ln -s /usr/local/java/bin/javah /usr/bin/javah
}

function setupEnvVars {
	echo "creating java environment variables"
	echo export JAVA_HOME=/usr/local/java >> /etc/profile.d/java.sh
	echo export PATH=\${JAVA_HOME}/bin:\${PATH} >> /etc/profile.d/java.sh
	chmod +x /etc/profile.d/java.sh
}

function installJava {
	echo "install openjdk 7 from repository"
	apt-get install -y openjdk-7-jdk
}

#  How to install ant and maven by http://www.unixmen.com/install-apache-ant-maven-tomcat-centos-76-5/

function installAnt {
	echo "install Ant from repository"
    apt-get install -y ant
}

function setupAntEnvVars {
	echo "creating Ant environment variables"
	echo \#!/bin/bash >> /etc/profile.d/ant.sh
	echo export ANT_HOME=/usr/local/ant >> /etc/profile.d/ant.sh
	echo export PATH=\${ANT_HOME}/bin:\${PATH} >> /etc/profile.d/ant.sh
	echo export CLASSPATH=. >> /etc/profile.d/ant.sh
    chmod +x /etc/profile.d/ant.sh
}

function installMaven {
	echo "install Maven from repository"
    apt-get install -y maven
}

function setupMavenEnvVars {
	echo export MAVEN_HOME=/usr/local/maven >> /etc/profile.d/maven.sh
	echo export PATH=\${MAVEN_HOME}/bin:\${PATH} >> /etc/profile.d/maven.sh
	echo export CLASSPATH=. >> /etc/profile.d/maven.sh
    chmod +x /etc/profile.d/maven.sh
}

function installrJava {
	echo "install rJava"
	source /etc/profile
	FILE=/vagrant/resources/$RJAVA_ARCHIVE
	R CMD javareconf
	R CMD INSTALL $FILE
}

echo "setup java"
installJava
#setupJava
#setupEnvVars
installAnt
#setupAntEnvVars
installMaven
#setupMavenEnvVars
#installrJava
