# REST API FUTURE-SPACE

Um dashboard mais clean pra ver lançamentos de foguetes.

## Setup

### Ambiente
É necessário instalar as seguintes aplicações:

    Ruby 3.1.2
    Docker 20.10.12

### Instalação e execução da aplicação

1. Faça o clone com **git clone git@github.com:jaferdaltro/future-space.git**

2. Vá ao diretório do projeto e execute

        $ bundle install


3. Inicie os containers do PostgreSQL

        $ docker-compose up


4. Faça o setup do banco de dados

        $ rake db:setup

5. Execute a aplicação

        $ rails s

6. Inciar o cron

        $ whenever --update-crontab

7. Inciar o Sidekiq

        $  bundle exec sidekiq

## REST API

Para executar a API de exemplo siga as intruções abaixo

### Lista de Lançamentos

### Request

`GET /lauchers`

    curl -i -H 'Accept: application/json' http://localhost:3000/launchers

## Obter a informação somente de um launch da base de dados

### Request

`GET /launchers/:launchId`

  curl --location --request GET 'localhost:3000/launchers/1

## Remover o launch da base

### Request

`DELETE /launchers/:launchId`

curl --location --request DELETE 'localhost:3000/launchers/1'
## Será responsável por receber atualizações realizadas

### Request

`PUT /launchers/:launchId`

curl --location --request DELETE 'localhost:3000/launchers/1'




