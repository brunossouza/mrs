import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mrs/app/models/funcionario.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textFieldcontroller = TextEditingController();

  Future<List<Funcionario>> searchFuncionario() async {
    var response =
        await http.get("https://mrs-search.herokuapp.com/api/funcionarios");

    var jsonData = json.decode(response.body);

    List<Funcionario> list = [];
    for (var f in jsonData) {
      Funcionario funcionario = Funcionario.fromJson(f);
      list.add(funcionario);
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 45.0,
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
                onPressed: () async {
                  //TODO: implement method
                  List<Funcionario> l = await searchFuncionario();
                  print(l.length);
                },
                child: Text(
                  'Pesquisar',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
