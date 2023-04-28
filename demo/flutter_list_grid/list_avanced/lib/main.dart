import 'package:flutter/material.dart';

/// Cette démo présente l'utilisation d'une ListView avancée.
/// Utilisation d'un builder.
/// Utilisation d'une collection d'objet Flag.
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
    /// Collection d'objets servant à alimenter Listview
    List<Flag> flags = [
      const Flag(name: "France", imageUrl: "assets/../assets/fr.png"),
      const Flag(name: "Belgique", imageUrl: "assets/../assets/be.png"),
      const Flag(name: "Etats Unis", imageUrl: "assets/../assets/us.png"),
      const Flag(name: "Grande Bretagne", imageUrl: "assets/../assets/uk.png"),
      const Flag(name: "Allemagne", imageUrl: "assets/../assets/de.png"),
      const Flag(name: "Chine", imageUrl: "assets/../assets/cn.png"),
      const Flag(name: "Canada", imageUrl: "assets/../assets/ca.png"),
      const Flag(name: "Suisse", imageUrl: "assets/../assets/sw.png"),
    ];

    return Scaffold(
      body: Center(
          child: ListView.builder(
              itemCount: flags.length,
              itemBuilder: (BuildContext context, int index) {
                return ListItem(flag: flags[index]);
              })),
    );
  }
}

/// Ce widget représente un rectangle simple avec un CircleAvatar et un text.
/// C'est un élément de la ListView
class ListItem extends StatelessWidget {
  final flag;

  const ListItem({required this.flag, super.key});

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration = BoxDecoration(
        color: Colors.indigoAccent, borderRadius: BorderRadius.circular(5));

    return Container(
      decoration: decoration,
      margin: const EdgeInsets.all(10.0),
      height: 50,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(flag.imageUrl),
        ),
        title: Text(flag.name),
      ),
    );
  }
}

class Flag {
  final name;
  final imageUrl;

  const Flag({required this.name, required this.imageUrl});
}
