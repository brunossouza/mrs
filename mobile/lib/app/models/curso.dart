class Cursos {
  String descricao;
  int id;
  String titulo;

  Cursos({this.descricao, this.id, this.titulo});

  Cursos.fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    id = json['id'];
    titulo = json['titulo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descricao'] = this.descricao;
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    return data;
  }
}
