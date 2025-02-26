# update ip's cart and mysql
cp shipping.service /etc/systemd/system/shipping.service

dnf install maven -y

useradd roboshop

mkdir /app
cd /app
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping-v3.zip
unzip /tmp/shipping.zip

mvn clean package
mv target/shipping-1.0.jar shipping.jar

dnf install mysql -y

# update mysql ip
mysql -h mysql.devopsb78.online -uroot -pRoboShop@1 < /app/db/schema.sql
mysql -h mysql.devopsb78.online -uroot -pRoboShop@1 < /app/db/app-user.sql
mysql -h mysql.devopsb78.online -uroot -pRoboShop@1 < /app/db/master-data.sql

systemctl daemon-reload
systemctl enable shipping
systemctl restart shipping

