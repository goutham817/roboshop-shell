dnf install mysql-server -mysql

systemctl enable mysql
systemctl start mysql

mysql_secure_installation --set-root-pass RoboShop@1