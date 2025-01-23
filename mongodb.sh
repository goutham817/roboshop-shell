source mongodb.repos

sed-i -e /127.0.0.1/ -e /0.0.0.0/ mongodb.sh

dnf install mongodb-org -y

systemctl enable mongod
systemctl start mongod

systemctl restart mongod
