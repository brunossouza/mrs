from flask import render_template, flash, redirect, url_for 
from app import app, db
from app.models.models import Curso
from app.models.forms import CursosForm

@app.route("/")
@app.route("/index")
@app.route("/funcionarios")
def index():
    return render_template("funcionarios.html")



@app.route("/cursos", methods=['GET', 'POST'])
def cursos():
    form = CursosForm()
    if form.validate_on_submit():
        curso = Curso(form.titulo.data, descricao=form.descricao.data)
        db.session.add(curso)
        db.session.commit()
        return redirect(url_for('cursos'))

    cursosList = Curso.query.all()
    return render_template("cursos.html", form=form, cursosList=cursosList)
