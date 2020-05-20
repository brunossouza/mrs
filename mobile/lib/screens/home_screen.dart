import 'package:flutter/material.dart';
import 'package:mrs/screens/funcionario_details.dart';
import 'package:provider/provider.dart';
import '../controller/funcionario_provider.dart';
import '../models/funcionario.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textFieldcontroller = TextEditingController();

  Future<void> _search() async {
    var search = textFieldcontroller.text;
    await Provider.of<FuncionarioProvider>(context, listen: false)
        .search(search);
  }

  @override
  Widget build(BuildContext context) {
    final _funcionariosList =
        Provider.of<FuncionarioProvider>(context, listen: false).funcionarios;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Hero(
          tag: 'logo-mrs',
          child: Image.asset(
            'assets/images/logo.png',
            height: 45.0,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: textFieldcontroller,
              decoration: InputDecoration(
                labelText: 'Pesquisar (nome, matrícula, curso)',
              ),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: _search,
                child: Text('Pesquisar'),
              ),
            ),
            _funcionariosList.isEmpty
                ? Expanded(
                    child: Container(
                    child: Center(
                      child: Text('Sem resultados'),
                    ),
                  ))
                : Expanded(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 10.0),
                            child: Text(
                              'Resultado da busca: ',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: _funcionariosList.length,
                              itemBuilder: (cxt, indice) {
                                Funcionario f = _funcionariosList[indice];
                                return Card(
                                  elevation: 5,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(f.avatarUrl),
                                    ),
                                    title: Text(
                                      f.nome,
                                      style: TextStyle(fontSize: 20.0),
                                    ),
                                    subtitle: Text(
                                      f.matricula,
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(Icons.arrow_forward_ios),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (cxt) =>
                                                FuncionarioDetails(
                                                    funcionario: f),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
