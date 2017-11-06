echo "-- Project Stuffs --"
mysql -e "CREATE DATABASE IF NOT EXISTS \`moj\` DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_unicode_ci";

wd=$(pwd)
cd /var/www

echo "-- Install Dependencies"
sudo -u www-data composer install

echo "-- Install WP --"
vendor/wp-cli/wp-cli/bin/wp core install --url=app.dev --title=MOJ --admin_user=moj --admin_password=password --admin_email=info@example.com --skip-email

echo "-- Install WP Plugins --"
sudo -u www-data vendor/wp-cli/wp-cli/bin/wp plugin activate wordpress-seo wordfence