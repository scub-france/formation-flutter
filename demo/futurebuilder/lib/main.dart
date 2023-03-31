import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Future Builder',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Scaffold(body: Center(child: FutureBuild()))));
}

/// Démonstration du Widget d'exploitation des Futures.
class FutureBuild extends StatelessWidget {
  FutureBuild({super.key});

  // Crée un FUTURE afin de simuler un chargement (une requête HTTP par exemple)
  // Renvoie d'un string 'Donnée chargée' après 5 secondes
  // On peut émettre Future.error('Error') pour simuler une erreur
  final Future<String> _data = Future<String>.delayed(
    const Duration(seconds: 5),
    () => 'Donnée chargée',
  );

  @override
  build(_) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Crée mon Widget FutureBuilder en lui passant mon Future
          // et je lui passe dans mon builder un AsyncSnapshot qui contient
          // les données et l'etat de mon Future
          FutureBuilder<String>(
            future: _data,
            builder: (_, snap) {
              // Si mon Future a des données, je les affiche ou je peux faire un traitement
              if (snap.hasData) {
                return Text('Message: ${snap.data}');
              }
              // Si mon Future a une erreur, je l'affiche ou je peux faire un traitement
              else if (snap.hasError) {
                return Text('${snap.error}');
              }
              // Sinon je renvoie un Widget de chargement
              else {
                return Column(
                  children: const [
                    Text('Loading'),
                    // Widget de chargement
                    CircularProgressIndicator(),
                  ],
                );
              }
            },
          ),
        ],
      );
}
