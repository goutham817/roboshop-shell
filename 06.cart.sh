dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y

useradd roboshop

mkdir /app

cd /app

curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart-v3.zip

unzip /tmp/cart.zip
npm install

cp cart.service /etc/systemd/system/cart.service

systemctl deamon-reload

systemctl enable cart
systemctl restart cart