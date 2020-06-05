from app import db

funcionario_curso = db.Table('funcionario_curso',
                             db.Column('funcionario_id', db.Integer,
                                       db.ForeignKey('funcionarios.id')),
                             db.Column('curso_id', db.Integer,
                                       db.ForeignKey('cursos.id'))
                             )


class Funcionario(db.Model):
    __tablename__ = "funcionarios"

    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String, nullable=False)
    avatar_url = db.Column(db.String, nullable=False,
                           server_default='https://thumbs.dreamstime.com/b/trabalhador-da-constru%C3%A7%C3%A3o-icon-ilustra%C3%A7%C3%A3o-de-person-profile-avatar-do-vetor-97315441.jpg')
    matricula = db.Column(db.String, unique=True, nullable=False)

    cursos = db.relationship('Curso', secondary=funcionario_curso,
                             backref=db.backref('cursos', lazy='dynamic'))

    def __init__(self, nome, matricula, cursos):
        self.nome = nome
        self.matricula = matricula
        self.cursos = cursos

    def __repr__(self):
        return '<Funcionario %r>' % self.nome


class Curso(db.Model):
    __tablename__ = "cursos"

    id = db.Column(db.Integer, primary_key=True)
    titulo = db.Column(db.String, nullable=False)
    descricao = db.Column(db.String)

    def __init__(self, titulo, descricao=''):
        self.titulo = titulo
        self.descricao = descricao

    def __repr__(self):
        return '<Curso %r>' % self.titulo
