# laravel-vuesplash

- tutorial
  https://www.hypertextcandy.com/vue-laravel-tutorial-introduction/

- start containers
  docker-compose up -d

- start server
  docker-compose exec vuesplash_web php artisan serve --host 0.0.0.0 --port 8081

- migrate db
  docker-compose exec vuesplash_web php artisan migrate

- watch frontend
  docker-compose exec vuesplash_web npm run watch
