from flask import request, jsonify
from app import app, db
from app.models.models import Funcionario
from app.utils import verificar, converter


@app.route("/api/funcionarios", methods=['GET'])
def api():
    funcionarios = converter.converte_funcionarios_map(Funcionario.query.all())
    return jsonify(funcionarios)


@app.route("/api/search/<buscar>", methods=['GET'])
def search(buscar):
    funcionarios = []

    buscar = buscar.strip()
    if verificar.is_number(buscar):
        result = Funcionario.query.filter_by(matricula=buscar).first()
    else:
        search = "%{}%".format(buscar)
        # busca funcionario pelo nome
        result = Funcionario.query.filter(
            Funcionario.nome.ilike(search)).all()

        # busca funcionario pelo curso
        result1 = Funcionario.query.filter(
            Funcionario.cursos.any(titulo=buscar)).all()

        for f in result1:
            print(f)
            if not f in result:
                result.append(f)

    funcionarios = converter.converte_funcionarios_map(result)
    return jsonify(funcionarios)
