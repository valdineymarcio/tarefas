import 'package:flutter/material.dart';
import 'package:tarefas/components/task.dart';
import 'package:tarefas/data/task_dao.dart';
import 'package:tarefas/data/task_inherited.dart';
import 'package:tarefas/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
          future: TaskDao().findAll(),
          builder: (context, snapshot) {
            List<Task>? itens = snapshot.data;
            //ListView.builder carrega so os dados do tamanho da tela
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Column(
                    children: [CircularProgressIndicator(), Text('Carregando')],
                  ),
                );
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    children: [CircularProgressIndicator(), Text('Carregando')],
                  ),
                );
                break;
              case ConnectionState.active:
                return Center(
                  child: Column(
                    children: [CircularProgressIndicator(), Text('Carregando')],
                  ),
                );
                break;
              case ConnectionState.done:
                if (snapshot.hasData && itens != null) {
                  if (itens.isEmpty) {
                    return ListView.builder(
                        itemCount: itens.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Task tarefa = itens[index];
                          return tarefa;
                        });
                  }
                  return Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 128,
                        ),
                        Text(
                          'Não a nenhuma tarefa',
                          style: TextStyle(fontSize: 32),
                        ),
                      ],
                    ),
                  );
                }
                return Text('Erro ao carregar tarefas');
                break;
            }
            return Text('erro desconhecido');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                  taskContext: context
              ),
            ),
          ).then((value) => setState((){
            print('recarregando a tela inicial');
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
