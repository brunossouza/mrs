# MRS

Descritivo sobre a organização do projeto e configurações básicas para execução do projeto.

## Em desenvolvimento

Em ambiente de desenvolvimento é aconselhavel a crição de um ambiente virtual(breve explicação - [pythonacademy - PYTHON E VIRTUALENV](https://pythonacademy.com.br/blog/python-e-virtualenv-como-programar-em-ambientes-virtuais)).

---

## Organização das pastas

### Pasta: backend

Pasta com códigos do backend da aplicação, esta deverá ser hospedade em um servidor quando em produção.

Código escrito em [Python 3](https://www.python.org/), utilizando-se da biblioteca [Flask](https://flask.palletsprojects.com/en/1.1.x/).

Para execução do projeto é necesária a instalação das biliotecas listadas no arquivo [backend/requirements.txt](backend/requirements.txt). Para realizar a instalação execute o seguinte comando:

```bash
$ cd backend
$ pip install -r requirements.txt
```

Uma vez dentro da pasta backend. Para executar o projeto siga os passo abaixo:

1. crie o banco de dados no postgresql 

2. export as variáveis de configuração do projeto, em desenvolvimento edite o arquivo `run-development.sh`:

```bash
export APP_SETTINGS="config.DevelopmentConfig"
export DATABASE_URL="postgresql+psycopg2://<user>:<password>t@<ip servidor>:5432/<database>"
```
- **APP_SETTINGS**
    - **config.DevelopmentConfig**: configuração de desenvolvimento;
    - **config.ProductionConfig**: configuração de produção;

- **DATABASE_URL**: uri de coneção dao banco de dados;
    - postgresql+psycopg2://user:password@127.0.0.1:5432/banco

3. Execute os comando abaixo para criar as tabelas do banco:

```bash
$ python run.py db init
$ python run.py db migrate
$ python run.py db upgrade
```

4 para executa o software:

```bash
$ chmod +x run-development.sh
$ ./run-development.sh
```

Após a execução do comando acima, va para seu navegador e acesse a seguinte url:

[http://localhost:5000](http://localhost:5000)

---

### Pasta: mobile

Código fonte do aplicativo mobile. Escrito em [Flutter](https://flutter.dev/).

Para execução do projeto é necesária a instalação do android sdk, do flutter, java jdk 8.


1. Acesse a pasta do projeto

```bash
$ cd mobile
```

2. Edite o arquivo:

> lib/controller/funcionario_provider.dart

Na linha 10, edite a variável para a url do servido do **backend**

```
static const _BASE_URL = 'http://192.168.1.0:5000/api/search/';
```
- exemplo: 
```
static const _BASE_URL = 'http://meu.servidor/api/search/';
```

3. Para executar o projeto execute o comando abaixo:

```bash
$ flutter run
```

4. criar o apk de instalação do aplicativo.

```bash
$ flutter build apk
```