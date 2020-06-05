import 'curso.dart';

class Funcionario {
  List<Cursos> cursos;
  String matricula;
  String avatarUrl;
  String nome;

  Funcionario({this.cursos, this.matricula, this.avatarUrl, this.nome});

  Funcionario.fromJson(Map<String, dynamic> json) {
    if (json['cursos'] != null) {
      cursos = new List<Cursos>();
      json['cursos'].forEach((v) {
        cursos.add(new Cursos.fromJson(v));
      });
    }
    matricula = json['matricula'];
    avatarUrl = json['avatar_url'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cursos != null) {
      data['cursos'] = this.cursos.map((v) => v.toJson()).toList();
    }
    data['matricula'] = this.matricula;
    data['avatar_url'] = this.avatarUrl;
    data['nome'] = this.nome;
    return data;
  }
}
