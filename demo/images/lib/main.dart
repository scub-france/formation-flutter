// Afficher des images
// Internet
// Asset
// Introduction à Blurhash

import 'package:flutter/material.dart';

void main() => runApp(const ImageApp());

class ImageApp extends StatelessWidget {
  const ImageApp({super.key});

  @override
  build(_) =>
      // Un conteneur externe d'une taille précise
  Center(
      child: Column(
        children: [
          Container(
              width: 350,
              height: 200,
              color: Colors.white,
              child: FittedBox(
                // L'image s'adapte pour occuper la hauteur maximale
                fit: BoxFit.fitHeight,
                // Le chargement se fait depuis une ressource externe
                child: Image.network(
                    'https://main--marvelous-crisp-dc8bf2.netlify.app/design/assets/pi_0.png'),
              )),
          Container(
            width: 300,
            height: 200,
            color: Colors.blue.shade100,
            child: FittedBox(
              // L'image s'adapte pour occuper la hauteur maximale
                fit: BoxFit.fitWidth,
                // Le chargement se fait depuis une ressource locale
                child: Image.asset('/assets/turtle.jpeg')),
          ),
        ],
      ));
}