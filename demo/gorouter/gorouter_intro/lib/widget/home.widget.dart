import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //Lors de la création du widget, nous avons besoin du 'contexte' en paramètre
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              // Ici, vous pouvez voir qu'en appuyant sur le bouton, nous irons dans '/settings'.
              // La route définie ici doit être identique au nom qui a été écrit à l'endroit où vous avez généré les routes
              onPressed: () => context.go('/settings'),
              child: const Text('Go to the setting Page'),
            ),
          ],
        ),
      ),
    );
  }
}