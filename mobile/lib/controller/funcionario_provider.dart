import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mrs/models/curso.dart';
import 'package:http/http.dart' as http;

import '../models/funcionario.dart';

class FuncionarioProvider with ChangeNotifier {
  static const _BASE_URL = 'https://mrs-search.herokuapp.com/api/search/';

  List<Funcionario> _funcionarios = [];

  List<Curso> _parseJsonToCursoList(data) {
    List<Curso> cursos = [];
    for (var item in data) {
      Curso curso = Curso(
        id: item['id'],
        titulo: item['titulo'],
        descricao: item['descricao'],
      );

      cursos.add(curso);
    }
    return cursos;
  }

  void _parseJsonToFuncionario(data) {
    for (var item in data) {
      Funcionario funcionario = Funcionario(
        id: item['id'],
        nome: item['nome'],
        matricula: item['matricula'],
        avatarUrl:
            'https://thumbs.dreamstime.com/b/trabalhador-da-constru%C3%A7%C3%A3o-icon-ilustra%C3%A7%C3%A3o-de-person-profile-avatar-do-vetor-97315441.jpg',
        cursos: _parseJsonToCursoList(item['cursos']),
      );
      _funcionarios.add(funcionario);
    }
  }

  List<Funcionario> get funcionarios {
    return [..._funcionarios];
  }

  Future<void> search(search) async {
    final url = _BASE_URL + search;
    try {
      _funcionarios = [];
      final response = await http.get(url);

      if (response.statusCode <= 400) {
        notifyListeners();

        _parseJsonToFuncionario(json.decode(response.body));
      }
    } catch (error) {
      print(error);
      notifyListeners();
    }
  }
}
