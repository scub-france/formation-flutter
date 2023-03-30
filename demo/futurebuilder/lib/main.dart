import 'package:flutter/material.dart';

void main() {
  runApp(FutureBuild());
}

class FutureBuild extends StatelessWidget {
  FutureBuild({super.key});

  /// Crée un FUTURE afin de simuler un chargement (une requête HTTP par exemple)
  /// ici je renvoie un string 'Data load' après 5 secondes
  /// Mais on peut aussi remplacer 'Data loading' par Future.error('Error') pour simuler une erreur
  final Future<String> _data = Future<String>.delayed(
    const Duration(seconds: 5),
    () => 'Data load',
  );

  @override
  build(context) => MaterialApp(
        title: 'Future Builder',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Crée mon Widget FutureBuilder en lui passant mon Future
              // et je lui passe dans mon builder un AsyncSnapshot qui contient
              // les données et l'etat de mon Future
              FutureBuilder(
                future: _data,
                builder: (_, snapshot) {
                  // Si mon Future a des données, je les affiche ou je peux faire un traitement
                  if (snapshot.hasData) {
                    return Text('${snapshot.data}');
                  }
                  // Si mon Future a une erreur, je l'affiche ou je peux faire un traitement
                  else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
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
          ),
        )),
      );
}
