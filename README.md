# README

## Dependências
* Ruby 2.7.1
* Rails 6.0.2
* PostgreSQL 9 or higher
* Webpacker 4 or higher



## Docker

Copiar `config/database.yml.sample` para `config/database.yml`
e mudar a configuração com

```
host: db
```

  ```shell
 docker-compose build
docker-compose run --rm runner bundle install
docker-compose run --rm runner yarn install --frozen-lockfile
docker-compose run --rm runner bundle exec rake db:create db:migrate db:seed
docker-compose run --rm runner_tests bundle exec rake db:create
docker-compose up
```
O servidor estará rodando na porta 5000, portanto no browser acesse

http://localhost:5005
