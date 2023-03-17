// Afficher des images
// Internet
// Asset
// Introduction à Blurhash

import 'package:flutter/material.dart';

void main() => runApp(const ImageApp());

/// Objectif: Explorer les différents modes d'affiches d'images
class ImageApp extends StatelessWidget {
  const ImageApp({super.key});

  @override
  build(_) =>
      // Un conteneur externe d'une taille précise
      Center(
          child: Column(
        children: [
          Container(
            width: 300,
            height: 200,
            color: Colors.blue.shade100,
            child: FittedBox(
                // L'image s'adapte pour occuper la largeur maximale
                fit: BoxFit.fitWidth,
                // Le chargement se fait depuis le dossier assets en ressource locale
                // sinon nous pourrions utiliser Image.network('/images/scub-logo.webp')
                // attention aux restrictions CORS si vous êtes en mode web
                child: Image.asset('/assets/turtle.jpeg')),
          ),
        ],
      ));
}
