#!/bin/bash

# Installing packages
#sudo apt-get update
#x=`echo $?`
	sudo apt-get install python3 
	echo 'python3 installed'
	py=`echo $?`
#else
#	echo 'error at installing python3'
#	exit 1
#fi



if [ $py == 0 ]
then
        sudo apt-get install python3-dev -y
        echo 'python3 installed'
        pydev=`echo $?`
else 
        echo 'error at installing python3dev'
        exit 1
fi

#sudo apt-get install python3-dev -y
#pydev=`echo $?`
if [ $pydev == 0 ]
then
	sudo apt-get install nginx
	ng=`echo $?`
	echo 'nginx successfully installed'
else
	echo ' error at nginx'
	exit 1 
fi

if [ $ng == 0 ]
then
	sudo apt-get install gunicorn  -y
	gu=`echo $?`
	echo 'gunicorn success installed'
else
	echo  'error at gunicorn'
	exit 1
fi

# Installing Virtual Environment
if [ $gu == 0 ]
then
	#sudo apt-get update
	pip3 install virtualenv
	venv=`echo $?`
	echo `virtualenv --version`
else
	echo ' virtualenv not installed'
	exit 1
fi


# Creating Virtual env and activate
`cd /home/Revanth/ChatTestApp`
virtualenv --python=python3 venv
echo ' activate venv with cmd: source venv/bin/activate'
#src=$?
