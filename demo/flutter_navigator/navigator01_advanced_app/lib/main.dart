import 'package:flutter/material.dart';

/**
 * Navigator 1.0
 * Cette démo est un exemple de navigation d'une page vers une autre.
 * Utilisation de routes nommées.
 * Passage d'arguments typés.
 * Retour d'arguments typés.
 */
void main() {
  runApp(const Navigator01AdvancedApp());
}

class Navigator01AdvancedApp extends StatelessWidget {
  const Navigator01AdvancedApp({super.key});

  @override
  Widget build(BuildContext context) {
    /**
     * MaterialApp est ici utilisé avec la propriété routes.
     * Le paramètre routes contient une map associant des routes à des widgets.
     */
    return MaterialApp(
      title: 'Navigator 1.0 Demo',
      home: const FirstPage(),
      routes: {
        '/second': (context) => const SecondPage(),
      },
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final Color INITIAL_COLOR = Colors.grey;
  final double INITIAL_WIDTH = 100;
  final double INITIAL_HEIGHT = 100;
  final double TOP_HEIGHT = 200;
  final double BOTTOM_HEIGHT = 150;
  final int ANIMATION_DURATION = 1;

  int _resultPopPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Première page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                /**
                 * Navigue vers une route nommée.
                 * Le paramètre optionnel arguments est passé.
                 * Ici on utilise CalledArguments qui permet de transmettre un type complexe avec plusieurs propriétés.
                 * Un résultat de type ReturnedArguments est attendu.
                 */
                final ReturnedArguments result = await Navigator.pushNamed(
                  context,
                  '/second',
                  arguments: const CalledArguments(
                    'Titre de la seconde page',
                    'Message de la seconde page.',
                  ),
                ) as ReturnedArguments;

                setState(() {
                  _resultPopPage = result.position;
                });
              },
              child: const Text('Naviguer vers la seconde page'),
            ),
            const SizedBox(height: 20),
            Center(
              child: AnimatedContainer(
                width: INITIAL_WIDTH,
                height: _resultPopPage == 0 ? INITIAL_HEIGHT : _resultPopPage == ReturnedArguments.TOP ? TOP_HEIGHT : BOTTOM_HEIGHT,
                color: _resultPopPage == 0 ? INITIAL_COLOR : _resultPopPage == ReturnedArguments.TOP ? Colors.red : Colors.blue,
                alignment: AlignmentDirectional.topCenter,
                duration: Duration(seconds: ANIMATION_DURATION),
                curve: Curves.fastOutSlowIn,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(_resultPopPage == 0 ? "Zone de message retour" : _resultPopPage == ReturnedArguments.TOP ? "La seconde page a été fermée avec le bouton HAUT" : "La seconde page a été fermée avec le bouton BAS")
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CalledArguments;

    return Scaffold(
      appBar: AppBar(
          title: Text(args.title),
          // provient de l'argument de type CalledArguments
          leading: BackButton(
              /**
             * Ferme la page en la supprimant de la pile de navigation.
             * Un argmument (String) est retournée.
             */
              onPressed: () => Navigator.pop(
                  context,
                  ReturnedArguments(ReturnedArguments.TOP)))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              /**
               * Ferme la page en la supprimant de la pile de navigation.
               * Un argmument (String) est retournée.
               */
              onPressed: () => Navigator.pop(
                  context,
                  ReturnedArguments(ReturnedArguments.BOTTOM)),
              child: const Text('Retour à la page précédente'),
            ),
            const SizedBox(height: 20), // Séparateur
            Text(args.message), // provient de l'argument de type CalledArguments
            const SizedBox(height: 20), // Séparateur
            const Text("Pour revenir à la première page, cliquez sur le bouton ci-dessus, ou sur l'icône flèche, en haut à gauche."),
          ],
        ),
      ),
    );
  }
}

/**
 * Définit un type d'argument complexe comportant deux propriétés.
 * Ce type peut être utilisé comme argument pour la navigation vers une route nommée.
 */
class CalledArguments {
  final String title;
  final String message;

  const CalledArguments(this.title, this.message);
}

/**
 * Définit un type d'argument complexe comportant une propriété.
 * Ce type peut être utilisé comme argument de retour lorsqu'une page est fermée.
 */
class ReturnedArguments {
  static const int TOP = 1;
  static const int BOTTOM = 2;

  final int position;

  const ReturnedArguments(this.position);
}
