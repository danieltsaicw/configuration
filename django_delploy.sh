
#local shell
chomd 700 <key_name>.pem
connect EC2 # check AWSconsole, click "CONNECT"


#EC2 shell
sudo apt-get install python-pip 
sudo apt-get install python-dev
sudo apt-get install nginx 
sudo apt-get install git
sudo apt-get update

sudo pip install virtualenv
git clone https://github.com/<user>/<repo>.git
cd <repo>
virtualenv venv
source venv/bin/activate
pip install -r requirement.txt
pip install django bcrypt django-extenstions
pip install gunicorn
cd <repo>
sudo vim settings.py

#settings.py
ALLOWED_HOST = ['<XXX.XXX.XXX.XXX>']
STATIC_ROOT = os.path.join(BASE_DIR, "static/")

#EC2 shell
cd ..
python manage.py collectstatic
gunicorn --bind 0.0.0.0:8000 <zillow.wsgi:application>







