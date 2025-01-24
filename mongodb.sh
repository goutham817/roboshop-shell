cp mongodb.repos /etc/yum.repos.d/mongodb.repos

dnf install mongodb-org -y
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
systemctl enable mongod
systemctl start mongod

systemctl restart mongod
