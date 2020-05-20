import 'package:flutter/material.dart';
import 'package:mrs/models/funcionario.dart';

class FuncionarioDetails extends StatelessWidget {
  final Funcionario funcionario;

  FuncionarioDetails({@required this.funcionario});

  Column listCursos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ...funcionario.cursos.map(
          (curso) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '- ${curso.titulo}',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                  ),
                ),
                if (curso.descricao.isNotEmpty)
                  Text(
                    curso.descricao,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                if (curso.descricao.isNotEmpty)
                  SizedBox(
                    height: 20.0,
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Detalhes'),
        actions: <Widget>[
          Hero(
            tag: 'logo-mrs',
            child: Image.asset(
              'assets/images/logo.png',
              height: 45.0,
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(funcionario.avatarUrl),
              SizedBox(
                height: 10.0,
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Nome',
                    style: TextStyle(color: Colors.grey),
                  ),
                  subtitle: Text(
                    funcionario.nome,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Matrícula',
                    style: TextStyle(color: Colors.grey),
                  ),
                  subtitle: Text(
                    funcionario.matricula,
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                child: ListTile(
                  title: Text(
                    'Cursos',
                    style: TextStyle(color: Colors.grey),
                  ),
                  subtitle: listCursos(),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
