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


class Especializacao(db.Model):
    __tablename__ = "especializacoes"

    id = db.Column(db.Integer, primary_key=True)
    titulo = db.Column(db.String, nullable=False)
    descricao = db.Column(db.String)

    def __init__(self, titulo, descricao=''):
        self.titulo = titulo
        self.descricao = descricao

    def __repr__(self):
        return '<Especializacao %r>' % self.titulo


class Capacitacao(db.Model):
    __tablename__ = "capacitacao"

    id = db.Column(db.Integer, primary_key=True)
    funcionario_id = db.Column(db.Integer, db.ForeignKey('funcionarios.id'))
    expecializacao_id = db.Column(
        db.Integer, db.ForeignKey('especializacoes.id'))

    def __repr__(self):
        return '<Especializacao %r>' % self.titulo
