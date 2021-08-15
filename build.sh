docker compose down
docker compose build
docker compose run --rm squid cat /etc/squid/conf.d/default.conf
docker compose up -d
