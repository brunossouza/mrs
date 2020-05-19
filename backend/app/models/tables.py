from app import db


class Funcionario(db.Model):
    __tablename__ = "funcionarios"

    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String, nullable=False)
    matricula = db.Column(db.String, unique=True, nullable=False)

    def __init__(self, nome, matricula):
        self.nome = nome
        self.matricula = matricula

    def __repr__(self):
        return '<Funcionario %r>' % self.nome


class Curso(db.Model):
    __tablename__ = "cursos"

    id = db.Column(db.Integer, primary_key=True)
    titulo = db.Column(db.String, nullable=False)
    codigo = db.Column(db.String)
    descricao = db.Column(db.String)

    def __init__(self, titulo, codigo, descricao=''):
        self.titulo = titulo
        self.codigo = codigo
        self.descricao = descricao

    def __repr__(self):
        return '<Curso %r>' % self.titulo


class Capacitacao(db.Model):
    __tablename__ = "capacitacao"

    id = db.Column(db.Integer, primary_key=True)
    funcionario_id = db.Column(db.Integer, db.ForeignKey('funcionarios.id'))
    curso_id = db.Column(
        db.Integer, db.ForeignKey('cursos.id'))

    def __init__(self,funcionario_id,curso_id):
        self.funcionario_id = funcionario_id
        self.curso_id = curso_id

    def __repr__(self):
        return '<Capacitacao id={} funcionario_id={} cursos_id={} >'.format(self.id ,self.funcionario_id, self.curso_id)
