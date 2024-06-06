# Use an official PHP runtime as a parent image
FROM php:7.4-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the current directory contents into the container at /var/www/html
COPY . /var/www/html

# Install any needed extensions
RUN docker-php-ext-install mysqli

# Grant permissions for the public directory
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Inform Docker that the container is listening on port 80
EXPOSE 80

# Run Apache server in the foreground
CMD ["apache2-foreground"]
