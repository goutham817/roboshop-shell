dnf module disable nginx -y
dnf module enable nginx:1.24 -y
dnf install nginx -y

systemctl enable nginx
systemctl start nginx

cp nginx.conf /etc/nginx/nginx.conf

rm -rf /usr/share/nginx/html/*

mkdir /usr/share/nginx/html

cd /usr/share/nginx/html

curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend-v3.zip

unzip /tmp/frontend.zip

systemctl restart nginx

