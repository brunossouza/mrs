# MRS

Descritivo sobre a organização do projeto e configurações básicas para execução do projeto.

## Em desenvolvimento

Em ambiente de desenvolvimento é aconselhavel a crição de um ambiente virtual(breve explicação - [pythonacademy - PYTHON E VIRTUALENV](https://pythonacademy.com.br/blog/python-e-virtualenv-como-programar-em-ambientes-virtuais)).

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

```bash
$ python run.py runserver --debug
```

Após a execução do comando acima, va para seu navegador e acesse a seguinte url:

[http://localhost:5000](http://localhost:5000)

Deverá ser exebido a mensagem:

> running

Para executar em modo de produção:

```bash
$ python run.py runserver
```
