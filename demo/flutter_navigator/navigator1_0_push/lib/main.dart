import 'package:flutter/material.dart';

/**
 * Navigator 1.0
 * Cette démo montre un exemple de navigation vers un widget.
 */
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Navigator 1.0 Demo', home: FirstScreen());
  }
}

/**
 * Widget écran
 */
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
                 * Navigue vers un nouvel écran en l'ajoutant à la pile de navigation.
                 */
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SecondScreen(),
                  ),
                );
              },
              child: const Text('Aller au second écran'),
            ),
          ],
        ),
      ),
    );
  }
}

/**
 * Widget écran
 */
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
                 * Navigue vers un nouvel écran en l'ajoutant à la pile de navigation.
                 */
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ThirdScreen(),
                  ),
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

/**
 * Widget écran
 */
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