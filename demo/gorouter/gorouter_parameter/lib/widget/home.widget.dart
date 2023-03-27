import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              // Ici, le bouton nous renvoie à la page "settings/:name".
              // Si vous remplacez "name" dans l'URL par une chaîne de caractères, vous verrez apparaître celui-ci dans l'AppBar
              onPressed: () => context.go('/settings/:name'),
              child: const Text('Go to the setting Page'),
            ),
          ],
        ),
      ),
    );
  }
}