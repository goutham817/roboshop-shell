cp catalogue.service /etc/systemd/system/catalogue.service

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
systemctl start catalogue
