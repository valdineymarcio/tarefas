import 'package:flutter/material.dart';
import 'package:tarefas/components/dificuldade.dart';
import 'package:tarefas/data/task_dao.dart';

class Task extends StatefulWidget {
  final String name;

  final int dificuldade;


   Task(this.name, this.dificuldade, {Key? key}) : super(key: key);
  int level = 0;
  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;
  int contadorDificuldade=0;

  Color colorSet() {
    if (contadorDificuldade == 1) {
      return const Color.fromARGB(255, 109, 0, 167);
    } else if (contadorDificuldade == 2) {
      return const Color.fromARGB(255, 112, 87, 53);
    } else if (contadorDificuldade >= 3) {
      return const Color.fromARGB(255, 112, 87, 53);
    }
    return Colors.blue;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: colorSet()),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.grey,
                      ),
                      width: 100,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(widget.name,
                                style: const TextStyle(
                                    fontSize: 24,
                                    overflow: TextOverflow.ellipsis))),
                        Dificuldade(
                          nivelDificuldade: widget.dificuldade,
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      child: ElevatedButton(
                        onLongPress: (){
                          TaskDao().delete(widget.name);
                        },
                        onPressed: () {
                          setState(() {
                            widget.level++;
                            if (((widget.level / widget.dificuldade) / 10) >= 1) {
                              contadorDificuldade++;
                              widget.level=0;
                            }
                          });
                          // print(level);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(Icons.arrow_drop_up),
                            Text('UP')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: colorSet(),
                        value: (widget.dificuldade != 0)
                            ? (widget.level / widget.dificuldade) / 10
                            : 1,
                      ),
                    ),
                    Text(
                      'Level: ${widget.level}',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
