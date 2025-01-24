# update mongodb ip in catalogue.service file
cp catalogue.service /etc/systemd/system/catalogue.service

cp mongodb.repo /etc/yum.repos.d/mongo.repo
dnf install mongodb-mongosh -y
#update mongo server ip below
mongosh --host MONGODB-SERVER-IPADDRESS </app/db/master-data.js

dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y

useradd roboshop

mkdir /app
cd /app
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip
unzip /tmp/catalogue.zip
npm install

systemctl daemon-reload
systemctl enable catalogue
systemctl restart catalogue
