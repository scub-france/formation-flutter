import 'package:flutter/material.dart';


void main() {
  runApp(const MyImages());
}

class MyImages extends StatelessWidget {
  const MyImages({super.key});


  @override
  build(context) {


    const imageUrl = 'https://picsum.photos/200/300';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Images'),
        ),
        body: ListView(
          children: [
            // Ajout d'une image depuis un réseau distant
            Column(
              children: [
                const Text('Ajout d\'image depuis un réseau distant'),
                Image.network(
                  'https://picsum.photos/200/300',
                  width: 200,
                  height: 200,
                ),
              ],
            ),

            // Ajout d'une image depuis les ressources de l'application
            Column(
              children: [
                const Text(
                    'Ajout d\'image depuis les ressources de l\'application'),
                Image.asset(
                  '/assets/poulet.jpg',
                  width: 200,
                  height: 200,
                ),
              ],
            ),

            // Ajout d'une image depuis un fichier local
            // Column(
            //   children: [
            //     const Text('Ajout d\'image depuis un fichier local'),
            //     Image.file(
            //       file,
            //       width: 200,
            //       height: 200,
            //     ),
            //   ],
            // ),
            // Ce widget ne fonctionne pas sur le Web car les navigateurs Web ne permettent pas l'accès direct au système de fichier local pour des raisons de sécurité

            // Ajout d'une image avec chargement asynchrone
            Column(
              children: [
                const Text('Ajout d\'une image avec chargement asynchrone'),
                FadeInImage.assetNetwork(
                  placeholder: '/assets/mountains.jpg',
                  image: imageUrl,
                  width: 200,
                  height: 200,
                  fadeInDuration: const Duration(milliseconds: 500),
                  fadeOutDuration: const Duration(milliseconds: 500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}