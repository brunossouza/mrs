from flask import render_template, redirect, url_for 
from app import app, db
from app.models.models import Curso, Funcionario
from app.models.forms import CursosForm, FuncionariosForm


@app.route("/", methods=['GET', 'POST'])
@app.route("/index", methods=['GET', 'POST'])
def index():
    form = FuncionariosForm()
    form.cursos.choices = [(c.id, c.titulo) for c in Curso.query.order_by('titulo')]
    if form.is_submitted():
        cursos = [Curso.query.get(c) for c in form.cursos.data]
        funcionario = Funcionario(form.nome.data, form.matricula.data, cursos)
        db.session.add(funcionario)
        db.session.commit()
        return redirect(url_for('index'))
    
    funcionariosList = Funcionario.query.all()
    return render_template("funcionarios.html", form=form, funcionariosList=funcionariosList)


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

