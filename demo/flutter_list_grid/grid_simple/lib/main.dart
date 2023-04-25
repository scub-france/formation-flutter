import 'package:flutter/material.dart';

/**
 * Cette démo présente l'utilisation d'une gridview simple.
 * Avec un nombre fixe (7) d'item dans la gridview.
 */
void main() => runApp(const GridSimpleApp());

class GridSimpleApp extends StatelessWidget {
  const GridSimpleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Démo List - Gridview',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridSimpleApp"),
      ),
      body: Center(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10, // Espacement horizontal entre les éléments de la gridview
            mainAxisSpacing: 20, // Espacement vertical entre les éléments de la gridview
            crossAxisCount: 3,
            // maxCrossAxisExtent: 500,
            children: const [
              GridItem(title: 'Willow'),
              GridItem(title: 'E.T.'),
              GridItem(title: 'Le professionnel'),
              GridItem(title: 'Highlander'),
              GridItem(title: 'Goonies'),
              GridItem(title: 'Start Wars'),
              GridItem(title: 'Mad Max'),
            ],
          )),
    );
  }
}

class GridItem extends StatelessWidget {
  final title;

  const GridItem({required this.title, super.key});

  @override
  Widget build(BuildContext context) {

    const decoration = BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [
            0.1,
            0.4,
            0.6,
            0.9,
          ],
          colors: [
            Colors.yellow,
            Colors.red,
            Colors.indigo,
            Colors.teal,
          ],
        )
    );

    return Stack(
      children: <Widget>[
        Container(
          decoration: decoration,
          width: 400,
          height: 400,
        ),
        Container(
          width: 400,
          height: 150,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );

  }

}
