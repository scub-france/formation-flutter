import 'package:flutter/material.dart';

/// Démonstration du Widget [FutureBuilder].
class FutureBuild extends StatelessWidget {
  FutureBuild({super.key});

  // Crée une Future afin de simuler un tâche (une requête HTTP par exemple)
  // Renvoie d'un string 'Donnée chargée' après quelques secondes
  // On peut émettre Future.error('Error') pour simuler une erreur
  final Future<String> _data = Future<String>.delayed(
    const Duration(seconds: 3),
    () => 'Donnée chargée',
  );

  @override
  build(context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Création d'un FutureBuilder en lui passant notre Future
          // Nous typons explicitement avec <String>
          FutureBuilder<String>(
            future: _data,
            // Remarquer que snap est maintenant de type AsyncSnapshot de type <String>.
            builder: (_, snap) {
              // Si mon Future a des données, je les affiche ou je peux faire un traitement
              if (snap.hasData) {
                return Text(
                  'Message: ${snap.data}',
                  style: Theme.of(context).textTheme.titleLarge,
                );
              }
              // Traitement d'une erreur
              else if (snap.hasError) {
                return Text(
                  'Erreur: ${snap.error}',
                  style: Theme.of(context).textTheme.titleLarge,
                );
              }
              // Sinon je renvoie un Widget de chargement
              else {
                return Column(
                  children: [
                    Text(
                      'Chargement...',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 10),
                    const CircularProgressIndicator(),
                  ],
                );
              }
            },
          ),
        ],
      );
}

void main() {
  runApp(MaterialApp(
      title: 'Future Builder',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Scaffold(body: Center(child: FutureBuild()))));
}
