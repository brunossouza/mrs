from flask_wtf import FlaskForm
from wtforms import StringField,TextAreaField, SelectMultipleField
from wtforms.validators import DataRequired


class CursosForm(FlaskForm):
    titulo = StringField('titulo', validators=[DataRequired()])
    descricao = TextAreaField('descricao')


class FuncionariosForm(FlaskForm):
    nome = StringField('titulo', validators=[DataRequired()])
    matricula = StringField('descricao', validators=[DataRequired()])
    cursos = SelectMultipleField('cursos', choices=[])