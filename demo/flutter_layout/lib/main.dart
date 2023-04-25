import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  build(context) {
    return MaterialApp(
      title: 'Flutter Layout',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Layout Demo'),
        ),
        body: Container(
          // Ajoute du padding pour donner de l'espace autour des widgets.
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              // Une ligne avec deux éléments.
              Row(
                children: <Widget>[
                  // Le premier élément prend autant de place que possible.
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.red,
                      child: const Center(
                        child: Text('Item 1'),
                      ),
                    ),
                  ),
                  // Ajoute de l'espace entre les éléments.
                  const SizedBox(width: 16.0),
                  // Le deuxième élément prend autant de place que possible.
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.green,
                      child: const Center(
                        child: Text('Item 2'),
                      ),
                    ),
                  ),
                ],
              ),
              // Ajoute de l'espace entre les deux lignes.
              const SizedBox(height: 16.0),
              // Un conteneur flexible qui peut se plier en cas de besoin.
              Flexible(
                child: Container(
                  color: Colors.blue,
                  // Un widget Wrap pour afficher plusieurs éléments horizontalement et verticalement.
                  child: Wrap(
                    spacing: 8.0,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.yellow,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.orange,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.purple,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.cyan,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.teal,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
