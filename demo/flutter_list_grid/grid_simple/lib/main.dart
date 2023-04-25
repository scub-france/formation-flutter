import 'package:flutter/material.dart';

/// Cette démo présente l'utilisation d'une GridView simple.
/// Avec un nombre fixe (7) d'items.
void main() => runApp(const GridSimpleApp());

class GridSimpleApp extends StatelessWidget {
  const GridSimpleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Démo List - GridView',
      home: HomePage(),
    );
  }
}

/// Widget page
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GridView.count(
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10, // Espacement horizontal entre les éléments de la GridView
            mainAxisSpacing: 20, // Espacement vertical entre les éléments de la GridView
            crossAxisCount: 3,
            children: const [ // Tableaux de Widgets constituant la GridView
              GridItem(num: 1),
              GridItem(num: 2),
              GridItem(num: 3),
              GridItem(num: 4),
              GridItem(num: 5),
              GridItem(num: 6),
              GridItem(num: 7),
            ],
          )),
    );
  }
}

/// Ce widget représente un carré simple avec du texte au centre.
/// C'est un élément de la GridView
class GridItem extends StatelessWidget {
  final num;

  const GridItem({required this.num, super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 400,
      height: 400,
      color: Colors.blueGrey,
      child: Center(
        child: Text(num.toString()),
      ),
    );

  }

}
