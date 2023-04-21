import 'package:flutter/material.dart';

/**
 * Navigator 1.0
 * Cette démo montre un exemple de navigation vers une route nommée avec passe de paramètre
 */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /**
     * MaterialApp est ici utilisé avec la propriété routes.
     * Le paramètre routes contient une map associant des routes à des widgets.
     */
    return MaterialApp(
      title: 'Navigator 1.0 Demo',
      home: const FirstScreen(),
      routes: {
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Premier écran')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                /**
                 * Navigue vers une route nommée an l'ajoutant à la pile de navigation.
                 */
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Aller au second écran'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second écran')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                /**
                 * Navigue vers une route nommée an l'ajoutant à la pile de navigation.
                 */
                Navigator.pushNamed(
                  context,
                  '/third',
                );
              },
              child: const Text('Aller au troisième écran'),
            ),
            const SizedBox(height: 20), // Séparateur
            ElevatedButton(
              onPressed: () {
                /**
                 * Ferme l'écran en le supprimant de la pile de navigation.
                 */
                Navigator.pop(context);
              },
              child: const Text('Retour à l\'écran précédent'),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Troisième écran')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                /**
                 * Ferme l'écran et retourne à la racine.
                 */
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text('Retour au premier écran'),
            ),
          ],
        ),
      ),
    );
  }
}
