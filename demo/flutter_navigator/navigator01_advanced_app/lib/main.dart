import 'package:flutter/material.dart';

/**
 * Navigator 1.0
 * Cette démo est un exemple de navigation d'une page vers une autre.
 * Utilisation de PageBuilder avec transition animée.
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

    return const MaterialApp(title: 'Navigator 1.0 Demo', home: FirstPage());
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
                final result =
                    await Navigator.of(context).push(_createRoute());

                // On change l'état du widget pour afficher la valeur de l'argument retourné.
                setState(() {
                  _resultPopPage = result.position;
                });
              },
              child: const Text('Naviguer vers la seconde page'),
            ),
            const SizedBox(height: 20),
            Center(
              child: _resultPopPage == 0
                  ? const Text("Zone de retour après fermeture")
                  : _resultPopPage == ReturnedArguments.top
                      ? const Text("La seconde page a été fermée avec le bouton HAUT")
                      : const Text("La seconde page a été fermée avec le bouton BAS"),
            )
          ],
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        SecondPage(args: const CalledArguments("Titre de ma deuxième page", "Message de ma deuxième page")),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

class SecondPage extends StatelessWidget {
  final args;

  SecondPage({required this.args, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(args.title),
          // provient de l'argument de type CalledArguments
          leading: BackButton(
              /**
             * Ferme la page en la supprimant de la pile de navigation.
             * Un argmument typé est retourné.
             */
              onPressed: () => Navigator.pop(
                  context, const ReturnedArguments(ReturnedArguments.top)))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              /**
               * Ferme la page en la supprimant de la pile de navigation.
               * Un argmument typé est retournée.
               */
              onPressed: () => Navigator.pop(
                  context, const ReturnedArguments(ReturnedArguments.bottom)),
              child: const Text('Retour à la page précédente'),
            ),
            const SizedBox(height: 20),
            // Séparateur
            Text(args.message),
            // provient de l'argument de type CalledArguments
            const SizedBox(height: 20),
            // Séparateur
            const Text(
                "Pour revenir à la première page, cliquez sur le bouton ci-dessus, ou sur l'icône flèche, en haut à gauche."),
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
  final title;
  final message;

  const CalledArguments(this.title, this.message);
}

/**
 * Définit un type d'argument complexe comportant une propriété.
 * Ce type peut être utilisé comme argument de retour lorsqu'une page est fermée.
 */
class ReturnedArguments {
  static const top = 1;
  static const bottom = 2;

  final position;

  const ReturnedArguments(this.position);
}
