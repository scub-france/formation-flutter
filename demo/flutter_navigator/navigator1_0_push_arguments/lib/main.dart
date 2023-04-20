import 'package:flutter/material.dart';

/**
 * Navigator 1.0
 * Cette démo montre un exemple de navigation vers un widget.
 * Avec passage d'arguments.
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
                 * Navigue vers un écran et attend un résultat.
                 */
                String result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SecondScreen(
                        title: "Un titre bien choisi pour le deuxième écran"),
                  ),
                );

                setState(() {
                  _resultPopScreen = result;
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
  final String title;

  const SecondScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(title),
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
          ],
        ),
      ),
    );
  }
}
