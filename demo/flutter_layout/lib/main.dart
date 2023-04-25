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
        // Ici, Container est le widget parent de tous les widgets qui seront en sont intérrieur
        // Container est un widget qui peut contenir d'autres widgets et qui permet de définir des propriétés telles que la couleur de fond ou la marge
        body: Container(
          // Ajoute du padding pour donner de l'espace autour des widgets.
          padding: const EdgeInsets.all(16.0),
          // Column est un enfant du wiget Container, il a deux enfants: Container et Flexible
          child: Column(
            // Column est un widget qui affiche des widget verticalement, les uns en dessous des autres
            children: <Widget>[
              // Un conteneur englobant les éléments.
              // Ici, Container est un enfant de Column, qui se trouve plus haut. Il a un enfant: Row
              Container(
                height: 150,
                color: Colors.grey,
                // Ici, Row est un enfant de Container, il a 2 enfants: Container et Expanded
                child: Row(
                  children: <Widget>[
                    // Ce Container a une taille défini mais si il était enveloppé du widget Expanded, il prendrait autant de place que le 2eme élement
                    Container(
                      color: Colors.red,
                      height: 100,
                      width: 70,
                      child: const Center(
                        child: Text('Item 1'),
                      ),
                    ),
                    // Ajoute de l'espace entre les éléments.
                    const SizedBox(width: 16.0), // SizeBox permet d'ajouter de l'espace vide
                    // Le deuxième élément prend autant de place que possible.
                    Expanded(
                      // Expanded permet à un enfant de remplir l'espace disponible dans un parent
                      child: Container(
                        // J'ai abaissé la taille du widget afin de constater la taille du parent, mais si vous enlever la height, le Container prendra toute la place disponible
                        height: 100,
                        color: Colors.green,
                        child: const Center(
                          child: Text('Item 2'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Ajoute de l'espace entre les deux lignes.
              const SizedBox(height: 16.0),
              // Flexible est similaire à Expanded mais qui peut se retracter pour s'adapter à l'espce disponible
              Flexible(
                // Nous enveloppons le Container avec Flexible pour qu'il puisse se retracter si necessaire
                // Ici, le Container est de couleur marron. Il est l'enfant du widget Flexible
                child: Container(
                  color: Colors.brown,
                  // Un widget Wrap pour afficher plusieurs éléments horizontalement et verticalement.
                  child: Wrap(
                    // Wrap affiche des widgets en les enveloppant et en les répartissant sur plusieurs lignes si necessaire. Essayez de modifier la taille de l'écran
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
