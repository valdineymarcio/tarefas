import 'package:flutter/material.dart';

class FirstChallenge extends StatelessWidget {
  const FirstChallenge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.orange,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.yellow,
                height: 100,
                width: 100,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.green,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.greenAccent,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.blue,
                height: 100,
                width: 100,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.purple,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.pink,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.brown,
                height: 100,
                width: 100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}