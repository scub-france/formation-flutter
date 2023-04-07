import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Afficher une AppBar avec le titre "LayoutBuilder Example"
    return Scaffold(
      appBar: AppBar(title: const Text('LayoutBuilder Example')),
      // Utiliser le LayoutBuilder pour rendre le widget adaptable à la taille du parent
      body: LayoutBuilder(
        // La fonction de rappel prend en entrée un contexte de construction (BuildContext) et un objet BoxConstraints qui représente les limites de taille maximale et minimale que le widget peut avoir
        builder: (BuildContext context, BoxConstraints constraints) {
          // Si la largeur maximale disponible est supérieure à 600 pixels, afficher une rangée de deux conteneurs (un rouge et un jaune)
          // Essayez de changer le `maxWidth` en `minWidth`, ou, changer le nombre de pixel et voyez le résultat
          if (constraints.maxWidth > 600) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.red,
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.yellow,
                ),
              ],
            );
          } else {
            // Sinon, afficher un seul conteneur rouge
            return Center(
              child: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.red,
              ),
            );
          }
        },
      ),
    );
  }
}
