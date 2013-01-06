#!/bin/sh

#how to get access-key and secure-key
#Go to the Amazon Web Services website at http://aws.amazon.com.
#Click My Account/Console, and then click Security Credentials.
#Under Your Account, click Security Credentials.
#In the spaces provided, type your user name and password, and then click Sign in using our secure server.
#Under Access Credentials, on the Access Keys tab, your access key ID is displayed. To view your secret key, under Secret Access Key, click Show.
KEYS='--aws-access-key ACCESS-KEY --aws-secret-key SECURE-KEY'

#instance id , see your aws console.
ID='i-704d1b29'

$IP='1.0.0.1'

#which java
export JAVA_HOME=/usr
#$JAVA_HOME/bin/java -version
export EC2_HOME=./ec2-api-tools-1.6.6.0
export PATH=$PATH:$EC2_HOME/bin

#show regions
#ec2-describe-regions $KEYS 

#set region
export EC2_URL=https://ec2.us-west-1.amazonaws.com

#start & associate ip
if [ $1 = "start" ];then
	echo "start" $ID
	ec2-start-instances $ID $KEYS
	#sleep 20
	#ec2-associate-address -i $ID $IP $KEYS
fi

#stop
if [ $1 = "stop" ];then
	echo "stop" $ID
	ec2-stop-instances $ID $KEYS
fi

exit 1

