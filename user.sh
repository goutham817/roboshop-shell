dnf module disable nodejs -y
dnf modue enable nodejs:20 -y
dnf install nodejs -y

useradd roboshop
mkdir /app
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user-v3.zip
cd /app
unzip /tmp/user.zip
npm install

cp user.service /etc/systemd/system/user.service

systemctl daemon-reload
systemctl enable user
systemctl start user

