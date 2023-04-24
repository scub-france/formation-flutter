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
                 * Navigue vers un nouvel écran, passe un argument et récupère un autre argument à la fermeture.
                 */
                String result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SecondScreen(
                        title: "Un titre bien choisi pour le deuxième écran"),
                  ),
                );

                setState(() {
                  /**
                   * Affiche l'argument passé à la fermeture de la seconde fenêtre, en modifiant l'état du widget
                   */
                  _resultPopScreen = result;
                });
              },
              child: const Text('Aller au second écran'),
            ),
            const SizedBox(height: 20), // Séparateur
            Text(_resultPopScreen),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String title;

  /**
   * Un argument est passé, et sera affiché dans la barre de titre.
   */
  const SecondScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(title), // title est un argument passé
          leading: BackButton(
              /**
               * Ferme l'écran en le supprimant de la pile de navigation.
               * Un argmument (String) est retournée.
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
                 * Ferme l'écran en le supprimant de la pile de navigation.
                 * Un argmument (String) est retournée.
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
