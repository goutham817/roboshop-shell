

dnf module disable nginx -y
dnf module enable nginx:1.24 -y
dnf install nginx -y

# upadte all ip's in nginx.conf file
cp nginx.conf /etc/nginx/nginx.conf

systemctl enable nginx
systemctl start nginx


rm -rf /usr/share/nginx/html/*

cd /usr/share/nginx/html

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip

unzip /tmp/frontend.zip

cd

systemctl restart nginx

