# README

Lemmove teste Juarez Lustosa

## Dependências
* Ruby 2.7.1
* Rails 6.0.2
* PostgreSQL 9 or higher
* Webpacker 4 or higher
* Redis

## Docker

Copiar `config/database.yml.sample` para `config/database.yml`

```shell
docker-compose build
docker-compose run --rm runner bundle install
docker-compose run --rm runner yarn install --frozen-lockfile
docker-compose run --rm runner bundle exec rake db:create db:migrate db:seed
docker-compose run --rm runner_tests bundle exec rake db:create
docker-compose up
```
O servidor estará rodando na porta 5000, portanto no browser acesse

http://localhost:5000

## TODO

- Colocar Mask imput campo data
- Adicionar teste de aceitação
- Finalizar o  i18n

## Obs
- Não ficou muito claro para mim a funcionalidade do disable e enabled
não sabia exatamente de que forma era para ser atualizado. Então realizo a
atualizão quando cria, pelo link e criei uma rake que pode ser executada como
background para ficar atualizando. Como era sabado acho que ninguem ia responder
rsrs.
- Resolvi usar o bulma ao inves do boot.
