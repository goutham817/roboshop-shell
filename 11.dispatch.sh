#update rabbitmq ip in dispatch.service file
cp dispatch.service /etc/systemd/system/dispatch.service

dnf install golang -y
useradd roboshop
mkdir /app
cd /app
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch-v3.zip
unzip /tmp/dispatch.zip
go mod init dispatch
go get
go build
systemctl daemon-reload
systemctl enable dispatch
systemctl start dispatch