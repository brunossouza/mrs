from app.models.models import Funcionario, Curso


def converter(funcionarioMap, funcionarioObjeto):
    cursos = [{'id': x.id, 'titulo': x.titulo,
               'descricao': x.descricao} for x in funcionarioObjeto.cursos]
    funcionarioMap.append(
        {'nome': funcionarioObjeto.nome, 'matricula': funcionarioObjeto.matricula, 'cursos': cursos})


def converte_funcionarios_map(funcionarios):
    funcionarioMap = []

    if not (type(funcionarios) == Funcionario):
        for f in funcionarios:
            converter(funcionarioMap, f)
    else:
        converter(funcionarioMap, funcionarios)

    return funcionarioMap
