docker compose build

docker compose up
docker compose up --build // пересобирает образы

docker ps

docker compose logs rasa

docker compose down -v
docker compose build --no-cache

docker compose run rasa train // переобучаем модель
