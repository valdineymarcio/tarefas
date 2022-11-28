import 'package:flutter/material.dart';
import 'package:tarefas/components/task.dart';
import 'package:tarefas/data/task_dao.dart';
import 'package:tarefas/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.taskContext}) : super(key: key);
  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController dificuldadeController = TextEditingController();
  TextEditingController imagemController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator(String? value) {
    if (value!.isEmpty || int.parse(value) > 5 || int.parse(value) < 1) {
      return true;
    }
    print("não deu agora :/");
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nova Tarefa'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (String? value) {
                            if (valueValidator(value)) {
                              return 'Insira o nome da Tarefa';
                            }
                            return null;
                          },
                          controller: nomeController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'nome',
                            fillColor: Colors.white70,
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (difficultyValidator(value)) {
                              return 'insira uma dificuldade entre 1 e 5';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          controller: dificuldadeController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'dificuldade',
                            fillColor: Colors.white70,
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (text) {
                            setState(() {});
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Insira uma URL de Imagem!';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.url,
                          controller: imagemController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'imagem',
                            fillColor: Colors.white70,
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 100,
                      width: 72,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.blue),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imagemController.text,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Container();
                          },
                          fit: BoxFit.cover,
                        ),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          TaskDao().salvar(Task(nomeController.text,
                              int.parse(dificuldadeController.text)));
                        }
                        ScaffoldMessenger.of(widget.taskContext).showSnackBar(
                            const SnackBar(
                                content: Text('Printando nova tarefa')));
                        Navigator.pop(context);
                      },
                      child: Text('maceta o dedo!'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
