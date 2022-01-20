# Save_Me

# 🔖 Sumário

- [Sobre](#%EF%B8%8F-sobre)
- [Tecnologias utilizadas](#-tecnologias-utilizadas)
- [Como baixar e executar?](#-como-baixar-e-executar)
  - [Baixando o projeto](#%EF%B8%8F-baixando-o-projeto)
- [Bancos de dados e tabelas](#-bancos-de-dados-e-tabelas)
- [Variáveis de ambiente](#-variáveis-de-ambiente)
- [Executando a API](#-executando-a-api)

## 🏷️ Sobre

API desenvolvida para aplicativo da disciplina de DDM

## 🚀 Tecnologias utilizadas

As principais tecnologias utilizadas foram: 


- [Node.js](https://nodejs.org/en/)
- [Express](http://expressjs.com/)
- [PostgreSQL](https://www.postgresql.org/)
- [Knex](https://knexjs.org/)

## 📦 Como baixar e executar?

**Antes de baixar e executar o projeto**, é necessário ter o **Node.js** já instalado e, em seguida, instalar as seguintes ferramentas:

- [Git](https://git-scm.com/)
- [Yarn](https://classic.yarnpkg.com/lang/en/)
- [Docker](https://www.docker.com/)

### ⬇️ Baixando o projeto

Abra o terminal do seu sistema operacional e execute os seguintes comandos:

```bash
  # Clonar o repositório
  git clone https://github.com/example@Server.git

  # Entrar no diretório
  cd @exampleServer

  # Instalar as dependências
  npm install
  yarn install
```

#### 🎲 Bancos de dados e tabelas

Com o docker já intalado, execute o seguinte comando no terminal:

```bash
$ docker run --name pg -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -p 5432:5432 -d postgres
```

Após isso, crie o banco de dados com o seguinte comando: 

```bash
$ docker exec pg psql -c "CREATE DATABASE save_me" -U root 
```

#### 🌐 Variáveis de ambiente

Na raíz do projeto, crie um arquivo `.env` e insira nele a linha abaixo:

```bash
ACCESS_TOKEN_SECRET=aplicativo_save_me_ddm
```
Essa será nossa *secret* para autenticação.

### 🏃 Executando a API

Com os bancos de dados em execução e estando no diretório da API, execute os seguintes comandos:

```bash
  # Criar as tabelas no PostgreSQL
  yarn knex:migrate
  # Executar o servidor
  yarn dev
```

