import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tarefas/data/task_dao.dart';

//async as coisas pode acontecer de forma assicrona
Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(TaskDao.tabela);
  }, version: 1,);
}

