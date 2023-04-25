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
              ListItem(name: "France", imageUrl:  "assets/../assets/fr.png"),
              ListItem(name: "Belgique", imageUrl:  "assets/../assets/be.png"),
              ListItem(name: "Etats Unis", imageUrl:  "assets/../assets/us.png"),
              ListItem(name: "Grande Bretagne", imageUrl:  "assets/../assets/uk.png"),
              ListItem(name: "Allemagne", imageUrl:  "assets/../assets/de.png"),
              ListItem(name: "Chine", imageUrl:  "assets/../assets/cn.png"),
              ListItem(name: "Canada", imageUrl:  "assets/../assets/ca.png"),
              ListItem(name: "Suisse", imageUrl:  "assets/../assets/sw.png"),
            ],
          )),
    );
  }
}

/// Ce widget représente un rectangle simple avec un CircleAvatar et un text.
/// C'est un élément de la ListView
class ListItem extends StatelessWidget {
  final name;
  final imageUrl;

  const ListItem({required this.name, required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration = BoxDecoration(
      color: Colors.indigoAccent,
        borderRadius: BorderRadius.circular(5));

    return Container(
      decoration: decoration,
      margin: EdgeInsets.all(10.0),
      height: 50,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imageUrl),
        ),
        title: Text(name),
      ),
    );
  }
}
