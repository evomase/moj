sudo apt-get update

echo "-- Prepare configuration for MySQL --"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

echo "-- Install PPA's --"
sudo apt-get install -y vim curl python-software-properties
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update -y

echo "-- Install packages --"
sudo apt-get install -y apache2 mysql-server-5.7 git-core
sudo apt-get install -y php7.1-fpm php7.1-cli php7.1-mcrypt php7.1-gd php7.1-mysql \
       php7.1-pgsql php7.1-imap php-memcached php7.1-mbstring php7.1-xml php7.1-curl \
       php7.1-bcmath php7.1-sqlite3 php7.1-xdebug php7.1-zip

echo "-- Configure PHP & Apache --"
sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.1/fpm/php.ini
sudo a2enmod rewrite

echo "-- Creating virtual hosts --"
cat << EOF | sudo tee -a /etc/apache2/sites-available/default.conf
<Directory "/var/www/">
    AllowOverride All
</Directory>
<VirtualHost *:80>
    DocumentRoot /var/www/web
    ServerName app.dev

    <Directory /var/www/web>
        Options -Indexes +FollowSymLinks +MultiViews
        AllowOverride All
        Require all granted
    </Directory>

    <FilesMatch \.php$>
        SetHandler "proxy:unix:/run/php/php7.1-fpm.sock|fcgi://localhost:9000/"
    </FilesMatch>
</VirtualHost>
EOF

sudo a2enmod proxy proxy_fcgi
sudo a2ensite default.conf
sudo service apache2 restart

chown -R www-data:www-data /var/www

echo "-- Install Composer --"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer

echo "-- Configure MySQL Access --"
cat > /root/.my.cnf << EOF
[client]
user = root
password = root
host = localhost
EOF

cp /root/.my.cnf /home/ubuntu/.my.cnf