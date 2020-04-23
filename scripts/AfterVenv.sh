# Installing Requirements
alias chatpath="cd  /home/revanth/ChatTestApp/chatapplication"
#. ./chatpath

# asking for ip address
read -p "enter the ip_adress of your system" IP_address

pip3 install -r requirements.txt
pip3 install django bcrypt django-extensions

# Install gunicorn
pip3 install gunicorn

python3 manage.py collectstatic --noinput

chatapp_path=`pwd`
cd `echo $chatapp_path`
# nginx configuration
#sudo cp /home/revanth/ChatTestApp/scripts/nginx  /etc/nginx/sites-available/chatapplication
#sudo ln -s /etc/nginx/sites-available/chatapplication /etc/nginx/sites-enabled/
touch /etc/nginx/sites-available/chatapp
chmod 777 /etc/nginx/sites-available/chatapp
sed -e "s*chatapp_path*$chatapp_path*g" -e "s*IP_address*$IP_address*g" /home/revanth/ChatTestApp/scripts/nginx.txt > /etc/nginx/sites-available/chatapp
ln -s /etc/nginx/sites-available/chatapp /etc/nginx/sites-enabled

# checking ngnix syntax
sudo nginx -t
sudo rm /etc/nginx/sites-enabled/default
sudo service nginx restart

