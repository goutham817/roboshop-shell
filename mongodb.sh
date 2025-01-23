cp mongodb.repos /etc/yum.repos.d/mongodb.repos

sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf

dnf install mongodb-org -y

systemctl enable mongod
systemctl start mongod

systemctl restart mongod
