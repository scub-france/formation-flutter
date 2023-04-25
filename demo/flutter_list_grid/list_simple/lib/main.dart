import 'package:flutter/material.dart';

/// Cette démo présente l'utilisation d'une ListView simple.
/// Avec un nombre fixe (7) d'items.
void main() => runApp(const ListSimpleApp());

class ListSimpleApp extends StatelessWidget {
  const ListSimpleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Démo List - ListView',
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
          child: ListView(
        padding: const EdgeInsets.all(8),
        children: const <Widget>[
          ListItem(num: 1),
          ListItem(num: 2),
          ListItem(num: 3),
          ListItem(num: 4),
          ListItem(num: 5),
          ListItem(num: 6),
          ListItem(num: 7),
        ],
      )),
    );
  }
}

/// Ce widget représente un rectangle simple avec du texte au centre.
/// C'est un élément de la ListView
class ListItem extends StatelessWidget {
  final num;

  const ListItem({required this.num, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 50,
      color: Colors.grey,
      child: Center(child: Text(num.toString())),
    );
  }
}
