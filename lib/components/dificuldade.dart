import 'package:flutter/material.dart';

class Dificuldade extends StatelessWidget {
  final int nivelDificuldade;

  const Dificuldade({
    required this.nivelDificuldade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: (nivelDificuldade >= 1) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (nivelDificuldade >= 2) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (nivelDificuldade >= 3) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (nivelDificuldade >= 4) ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (nivelDificuldade >= 5) ? Colors.blue : Colors.blue[100],
        ),
      ],
    );
  }
}
