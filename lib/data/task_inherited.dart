import 'package:flutter/material.dart';
import 'package:tarefas/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List <Task>taskList= [Task(
      'Aprender Flutter',
      3),
    Task(
        'Aprender java',

        4),
    Task(
        'Correr',

        5),
    Task(
        'Ler',

        3),
    Task(
        'Academia',
        1),];
  void newTesk(String name, int difficuldade){
    taskList.add(Task(name, difficuldade));
  }


// fica de olho no estado da informação atual
  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }


  //fica de olho no estado anterior da informação
  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length !=taskList.length;
  }
}
