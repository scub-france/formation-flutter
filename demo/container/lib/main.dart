import 'package:flutter/material.dart';

void main() {
  runApp(const ContainerWidget());
}

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({super.key});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

/// Dans cet exemple, nous allons voir comment utiliser le widget [Container]
class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  build(_) => MaterialApp(
      title: 'Container Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Container Demo'),
        ),
        body: Column(
          children: [
            _space('Padding'),
            _padding(),
            _space('Margin'),
            _margin(),
            _space('Contraintes'),
            _contraints(),
            _space('Taille'),
            _size(),
            _space('Alignement'),
            _alignment(),
          ],
        ),
      ));

  // Dans ce cas, nous utilisons un [Padding] pour ajouter de l'espace à l'intérieur du container
  Widget _padding() => Container(
        padding: const EdgeInsets.all(16.0), // Ajoute 16 pixels de padding à tous les côtés
        color: Colors.blue,
        child: const Text('Container avec un padding', style: TextStyle(fontSize: 24.0)),
      );

  // Dans ce cas, nous utilisons un [Margin] pour ajouter de l'espace autour du container
  Widget _margin() => Container(
        margin: const EdgeInsets.all(16.0),
        color: Colors.yellow,
        child: const Text('Container avec un margin', style: TextStyle(fontSize: 24.0)),
      );

  // Dans ce cas, nous utilisons un [BoxConstraints] pour définir une taille minimale pour le container
  Widget _contraints() => Container(
        constraints: const BoxConstraints.expand(height: 200.0),
        color: Colors.red,
        child: const Text('Container avec une contraintes', style: TextStyle(fontSize: 24.0)),
      );

  // Dans ce cas, nous utilisons les propriétés [width] et [height] pour définir une taille fixe pour le container
  Widget _size() => Container(
        width: 200.0,
        height: 200.0,
        color: Colors.green,
        child: const Text('Container avec une taille fixe', style: TextStyle(fontSize: 24.0)),
      );

  // Dans ce cas, nous utilisons la propriété [alignment] pour définir l'alignement du widget enfant
  Widget _alignment() => Container(
        alignment: Alignment.bottomRight,
        color: Colors.purple,
        child: const Text('Container avec un alignement', style: TextStyle(fontSize: 24.0)),
      );

  // récupere un text et l'entoure d'un [Padding]
  Widget _space(String text) => Padding(
      padding: const EdgeInsets.all(3.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
      ));
}
