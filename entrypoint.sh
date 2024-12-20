#!/bin/bash

# Add .htacces according to https://www.rainloop.net/docs/installation/#notice
echo "Require all denied" > /rainloop/data/.htaccess

# Set rainloop directory permissions to catch bind mounts too
chown -R www-data:www-data /rainloop/data
find /rainloop -type d -exec chmod 755 {} \;
find /rainloop -type f -exec chmod 644 {} \;


# Call same entrypoint command as base image
/usr/local/bin/apache2-foreground
