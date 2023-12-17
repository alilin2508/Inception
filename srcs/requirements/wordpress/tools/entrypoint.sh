#!/bin/sh

cd ${WP_PATH}

if [ ! -e "wp-config.php" ] ; then
    while [ ! -e "wp-config.php" ]; do
        wp config create --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --dbhost=${DB_HOST}
    done
fi

if ! wp core is-installed ; then
    wp core install --url=${DOMAIN_NAME} --title="Inception" --admin_name=${WP_ADMIN} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} --skip-email
fi

if [[ $(wp user list --field=user_login | grep ${WP_USER} | wc -l) -eq 0 ]]; then
	wp user create ${WP_USER} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASS} --role=editor
fi

# wp theme install twentytwentyfour --activate

# Start PHP-FPM
exec php-fpm8 -F