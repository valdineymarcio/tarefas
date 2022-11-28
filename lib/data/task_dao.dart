import 'package:sqflite/sqflite.dart';
import 'package:tarefas/components/task.dart';
import 'package:tarefas/data/database.dart';

class TaskDao {
  static const String tabela = 'CREATE TABLE $_tablenome('
      '$_nome TEXT,'
      '$_dificuldade INTEGET,)';

  static const String _tablenome = 'taskTable';
  static const String _nome = 'nome';
  static const String _dificuldade = 'dificuldade';

//crete e update
  salvar(Task tarefa) async {
    print('Iniciando o salvar');
    final Database database = await getDatabase();
    var itemExistente = await find(tarefa.name);
    Map<String, dynamic> taskMap = topMap(tarefa);
    if (itemExistente.isEmpty) {
      print('tarefa não existente');
      return await database.insert(_tablenome, taskMap);
    } else {
      print('tarefa ja existente');
      //verifica se ele possui o mesmo nome da tarefa
      return await database.update(
        _tablenome,
        taskMap,
        where: '$_nome=?',
        whereArgs: [tarefa.name],
      );
    }
  }

  //trasformar uma tarefa em um mapa
  Map<String, dynamic> topMap(Task tarefa) {
    print('convertendo tarefa em map ');
    final Map<String, dynamic> mapaDetarefas = Map();
    mapaDetarefas[_nome] = tarefa.name;
    mapaDetarefas[_dificuldade] = tarefa.dificuldade;
    print('Mapa de tarefas$mapaDetarefas');
    return mapaDetarefas;
  }

  // retorna uma lista de tarefas
  Future<List<Task>> findAll() async {
    print('estou dentro do findAll');
    final Database database = await getDatabase();
    //sqflite retorna um objeto do tipo map
    final List<Map<String, dynamic>> resultado =
        await database.query(_tablenome);
    print('procurando dados... encontrado$resultado');
    return toList(resultado);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('convetendo to List');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_nome], linha[_dificuldade]);
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas$tarefas');
    return tarefas;
  }

  // buscar uma tarefa
  Future<List<Task>> find(String nomeDaTarefa) async {
    print('estou dentro do find');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> resultado = await database
        .query(_tablenome, where: '$_nome = ?', whereArgs: [nomeDaTarefa]);
    print('Tarefa encontrada${toList(resultado)}');
    return toList(resultado);
  }

  //deletar
  delete(String nomeDatarefa) async {
    print('deletou a tarefa em parça?!$nomeDatarefa');
    final Database database = await getDatabase();
    return database
        .delete(_tablenome, where: '$_nome = ?', whereArgs: [nomeDatarefa]);
  }
}
