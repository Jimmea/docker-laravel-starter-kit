echo "1/4-Downloading Laravel" &&
docker run -ti --rm -v ${HOME}:/root -v $(pwd):/git alpine/git clone https://github.com/laravel/laravel/ ./source > /dev/null &&
rm -R ./source/.git  > /dev/null &&
echo "2/4-Building images" &&
docker-compose build  > /dev/null &&
echo "3/4-Starting containers" &&
docker-compose up -d  > /dev/null &&
echo "4/4-Running composer install" &&
docker-compose exec php composer install > /dev/null &&
cp ./source/.env.example ./source/.env  > /dev/null &&
docker-compose exec php artisan key:generate > /dev/null &&
echo "Sucessfully Installed Laravel on containers" 