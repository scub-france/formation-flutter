import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Stream Builder',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Scaffold(body: Center(child: StreamBuild()))));
}

/// Démonstration du Widget d'exploitation des Stream.
class StreamBuild extends StatelessWidget {
  StreamBuild({super.key});

  // Crée un flux(un stream) qui grâce à [Stream.periodic] émet un entier toutes les secondes et qui s'arrête après 5 émissions
  // grâce à la méthode [Stream.take]
  final Stream<int> _stream =  Stream.periodic(const Duration(seconds: 1), (i) => i).take(5);

  @override
  build(_) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Crée mon Widget StreamBuilder en lui passant mon Stream
      StreamBuilder<int>(
        stream: _stream,
        builder: (_, snap) {
          // Si mon Stream a une erreur, je l'affiche ou je peux faire un traitement
          if (snap.hasError) {
            return Text('${snap.error}');
          }
          else {
            switch( snap.connectionState ) {
              // Si mon Stream a des données, je les affiche ou je peux faire un traitement
              case ConnectionState.active:
              return Column(
                children: [
                  const Text('Active'),
                  Text('Message: ${snap.data}'),
                ],
              );
              // Si mon Stream est en attente de données, je renvoie un Widget de chargement
              case ConnectionState.waiting:
                return Column(
                  children: const [
                    Text('Loading'),
                    // Widget de chargement
                    CircularProgressIndicator(),
                  ],
                );
              // Si mon Stream n'a pas de données, je renvoie un message
              case ConnectionState.none:
              return const Text('No data');

              // Si mon Stream est terminé, je renvoie un message
              case ConnectionState.done:
              return const Text('Done');

              // Si il y'a un problème de type, je renvoie un message par défaut
              default:
                return const Text('Message: default');
            }
          }
        },
      ),
    ],
  );
}
