#! /bin/bash

#gunicorn --bind 0.0.0.0:8000 chatapp.wsgi:application
chatapp_path=`pwd`
# create gunicorn.service file
sudo touch /etc/systemd/system/gunicorn.service
sudo chmod 777 /etc/systemd/system/gunicorn.service
sed -e "s*chatapp_path*$chatapp_path*g" -e  "s*user_name*$USER*g" /home/revanth/ChatTestApp/scripts/gunicorn.txt > /etc/systemd/system/gunicorn.service


#sudo cp /home/Revanth/ChatTestApp/scripts/gunicorn.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
