import 'package:flutter/material.dart';

/// Navigator 1.0
/// Cette démo est un exemple de navigation d'une page vers une autre page.
/// On utilise ici une route nommée.
void main() {
  runApp(const NamedRouteApp());
}

class NamedRouteApp extends StatelessWidget {
  const NamedRouteApp({super.key});

  @override
  Widget build(BuildContext context) {
     /// MaterialApp est ici utilisé avec la propriété routes.
     /// Le paramètre routes contient une map associant des routes à des widgets.
    return MaterialApp(
      title: 'Navigator 1.0 Demo',
      home: const FirstPage(),
      routes: {
        '/second': (context) => SecondPage(),
      },
    );
  }
}

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
              /// Navigue vers une route nommée an l'ajoutant à la pile de navigation.
              onPressed: () => Navigator.pushNamed(context, '/second'),
              child: const Text('Naviguer vers la seconde page'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget page
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
              /// Ferme la page en la supprimant de la pile de navigation.
              onPressed: () => Navigator.pop(context),
              child: const Text('Retour à la page précédente'),
            ),
          ],
        ),
      ),
    );
  }
}
