from flask_wtf import FlaskForm
from wtforms import StringField,TextAreaField
from wtforms.validators import DataRequired

class CursosForm(FlaskForm):
    titulo = StringField('titulo', validators=[DataRequired()])
    descricao = TextAreaField('descricao')