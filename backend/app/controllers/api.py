from flask import request, jsonify
from app import app, db
from app.models.models import Funcionario


@app.route("/api/funcionarios", methods=['GET'])
def api():
    funcionarios = Funcionario.query.all()

    jsonData = []
    for f in funcionarios:
        cursos  = [{'id':x.id,'titulo':x.titulo,'descricao':x.descricao} for x in f.cursos]
        jsonData.append({'nome':f.nome,'matricula':f.matricula, 'cursos': cursos})

    return jsonify(jsonData)

