#/bin/bash
echo -n “Enter virtual hostname(example.com):”
read host
mkdir -p /mnt/projects/$host/
ln -s /mnt/projects/$host/ /var/www/$host
#chmod -R 777 /mnt/projects/$host
cp /etc/apache2/sites-available/new /etc/apache2/sites-available/$host
sed -i “s/abc/www.$host/g” /etc/apache2/sites-available/$host
sed -i “s/def/$host/g” /etc/apache2/sites-available/$host
sed -i “s/xyz/$host/g” /etc/apache2/sites-available/$host
a2ensite $host > /dev/null
service apache2 restart > /dev/null 2>&1
#cp /home/comx/index.html /mnt/projects/$host
echo “Successfully $host has been created”
echo “Url http://$host “
echo “You must copy your files into /mnt/projects/$host/ directory.”
