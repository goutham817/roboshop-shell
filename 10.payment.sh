#cart,user,rabbitmq update ip in payment.service file
cp payment.service /etc/systemd/system/payment.service

dnf install python3 gcc python3-devel -y

useradd roboshop

mkdir /app
cd /app

curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment-v3.zip
unzip /tmp/payment.zip
pip3 install -r requirements.txt

systemctl daemon-reload
systemctl enable payment
systemctl start payment