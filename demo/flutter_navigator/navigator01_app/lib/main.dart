import 'package:flutter/material.dart';

/**
 * Navigator 1.0
 * Cette démo est un exemple simple de navigation d'une page vers une autre.
 */
void main() {
  runApp(const Navigator01App());
}

class Navigator01App extends StatelessWidget {
  const Navigator01App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Navigator 1.0 Demo', home: FirstPage());
  }
}

/**
 * Widget page
 */
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Première page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              /**
               * Navigue vers une nouvelle page en l'ajoutant à la pile de navigation.
               */
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SecondPage(),
                ),
              ),
              child: const Text('Naviguer vers la seconde page'),
            ),
          ],
        ),
      ),
    );
  }
}

/**
 * Widget page
 */
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: const Text('Seconde page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              /**
               * Ferme la page en la supprimant de la pile de navigation.
               */
              onPressed: () => Navigator.pop(context),
              child: const Text('Retour à la page précédente'),
            ),
          ],
        ),
      ),
    );
  }
}
