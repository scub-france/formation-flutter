import 'package:flutter/material.dart';

/**
 * Navigator 1.0
 * Cette démo montre un exemple de navigation vers une route nommée avec passe de paramètre
 * Avec passage d'arguments.
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
      },
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String _resultPopScreen = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Premier écran')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                /**
                 * Navigue vers une route nommée.
                 * Le paramètre optionnel arguments est passé.
                 * Un résultat de type Object est attendu.
                 */
                dynamic result = await Navigator.pushNamed(
                  context,
                  '/second',
                  arguments: ScreenArguments(
                    'Titre du second écran',
                    'Message du second écran.',
                  ),
                );

                setState(() {
                  _resultPopScreen = result.toString();
                });
              },
              child: const Text('Aller au second écran'),
            ),
            const SizedBox(height: 20),
            Text(_resultPopScreen),
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
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
          title: Text(args.title),
          leading: BackButton(
              /**
               * Ferme l'écran et retourne un argument
               */
              onPressed: () => Navigator.pop(context,
                  "La seconde fenêtre a été fermée par le premier bouton"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                /**
                 * Ferme l'écran et retourne un argument
                 */
                Navigator.pop(context,
                    "La seconde fenêtre a été fermée par le deuxième bouton");
              },
              child: const Text('Retour à l\'écran précédent'),
            ),
            SizedBox(height: 20),
            Text(args.message)
          ],
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}
