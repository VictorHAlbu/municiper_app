# Municiper App
Essa aplicação tem o objetivo de cadastrar Munucipes(pessoas) e usa algum services como envio de email e de sms com Twilio.<br>
Para usar o service de envio de sms é necessário ter uma conta no site https://www.twilio.com/, pegar o id da conta, token e número e assim passar suas credentials no arquivo .env para que o mesmo funcione


# Tecnologias

Para desenvolver o projeto foi usado as tecnologias: Ruby on Rails, JavaScript, Postgresql e Bootstrap

### Pré-requisitos

Para rodar o projeto na sua máquina, deve ter instalado o ruby '2.7.1' e o 'rails', '~> 6.1.6' e Postgres

```
gem 'rails', '~> 6.1.6'
ruby '2.7.1'
Postgresql 
```

Na sua máquina execute os comandos:
```
bundle install
yarn install
```

Obs:  
 

Em seguida crie sua base de dados com comandos:

```
rails db:create
rails db:migrate
```
Test:<br>
para rodar os testes de acordo com model desejádo rode o comando<br>
ex:
```
rspec spec/model/user_spec.rb

```

Para subir o projeto local execute:
```
rails s
```

