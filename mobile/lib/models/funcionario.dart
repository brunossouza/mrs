import 'curso.dart';

class Funcionario {
  final int id;
  final String nome;
  final String matricula;
  final avatarUrl;
  final List<Curso> cursos;

  Funcionario(
      {this.id, this.nome, this.matricula, this.cursos, this.avatarUrl});
}
