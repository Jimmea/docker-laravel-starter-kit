#  <font color='red'>Requirements</font>
1. Stable version of [Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce-1)
2. Compatible version of [Docker Compose](https://docs.docker.com/compose/install/#install-compose)

----------

#  Installation
1. Install Laravel on containers:
    - `./getLaravel.sh`

2. Install Lumen on containers:
    `./getLumen.sh`
    
3. Install NPM support for Laravel on containers:
    - `./npmSupport.sh`

4. Generate the application key
    - Write your key inside the ./source/.env file on `APP_KEY` var
    - Use artisan to generate the key
        `docker-compose exec php php artisan key:generate`

#  What includes?
1. Laravel (PHP-FPM 7.3 + NGINX Stable)
2. Mysql 5.7
3. Npm (Node LTS, Stretch Slim)
    This container will allow you to compile saas and js with Laravel mix
4. Phpmyadmin Stable
5. Redis
6. Elasticsearch
7. Mongo 
-----------

# Commands
- Run a command inside a container: `docker-compose exec [container] [command]`
- Build all containers: `docker-compose build`
- Start all containers: `docker-compose up -d`
- Stop all containers: `docker-compose stop`
- Restart all containers: `docker-compose restart`
- Remove all container: `docker container rm $(docker container list -aq)`

- Run composer update: `docker-compose exec app composer update`
- Run composer install: `docker-compose exec app composer install`
- Install redis: `docker-compose exec php composer require predis/predis`
