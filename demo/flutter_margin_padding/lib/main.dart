import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercice sur l\'Alignment',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exercice sur l\'Alignment'),
        ),
        body: Center(
          // Nous utilisons le widget Container pour définir le conteneur qui va contenir le widget Text.
          // Nous utilisons la propriété color pour donner une couleur de fond au conteneur.
          // Nous utilisons également la propriété height pour donner une hauteur fixe à notre conteneur.
          child: Container(
            color: Colors.blueGrey,
            height: 200,
            // Ici, nous utilisons la propriété alignment pour définir l'alignement de notre widget Text.
            // Nous utilisons la valeur Alignment.bottomRight pour aligner le texte dans le coin inférieur droit du conteneur.
            alignment: Alignment.bottomRight,
            // Nous utilisons la propriété alignment pour définir l'alignement de notre widget Text dans le conteneur.
            child: const Text(
              'Bonjour les élèves !',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
