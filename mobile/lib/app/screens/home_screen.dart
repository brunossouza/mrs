import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/funcionario.dart';
import './funcionario_details.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textFieldcontroller = TextEditingController();
  List<Funcionario> funcionarios = [];

  bool pesquisando = false;

  void searchFuncionario() async {
    setState(() {
      pesquisando = true;
      funcionarios = [];
    });

    var response = await http.get(
        "https://mrs-search.herokuapp.com/api/search/" +
            textFieldcontroller.text);

    var jsonData = json.decode(response.body);

    List<Funcionario> list = [];
    for (var f in jsonData) {
      Funcionario funcionario = Funcionario.fromJson(f);
      list.add(funcionario);
    }

    print(list[0].avatarUrl);

    setState(() {
      funcionarios = list;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                color: Colors.blue,
                onPressed: searchFuncionario,
                child: Text(
                  'Pesquisar',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            if (!pesquisando)
              Expanded(
                child: Container(
                  child: Center(
                    child: Text("Sem resultados"),
                  ),
                ),
              ),
            if (pesquisando)
              funcionarios.isEmpty
                  ? Expanded(
                      child: Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    )
                  : Expanded(
                      child: Container(
                        child: ListView.builder(
                            itemCount: funcionarios.length,
                            itemBuilder: (cxt, ind) {
                              Funcionario f = funcionarios[ind];
                              print(f.avatarUrl);
                              return Card(
                                elevation: 5,
                                child: ListTile(
                                  onTap: () => Navigator.of(context).pushNamed(
                                      FuncionarioDetails.routeName,
                                      arguments: f),
                                  leading: Hero(
                                    tag: f.nome,
                                    child: Image.network(f.avatarUrl),
                                  ),
                                  title: Text(f.nome),
                                  trailing: Icon(Icons.arrow_forward_ios),
                                ),
                              );
                            }),
                      ),
                    )
          ],
        ),
      ),
    );
  }
}
