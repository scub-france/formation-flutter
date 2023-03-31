import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              // Bouton pour naviguer vers la page des paramètres en utilisant `goNamed`
              onPressed: () => context.goNamed(
                "settings",
                // Paramètres obligatoires
                params: {"name": "kind of magic"},
                // Paramètres optionnels sous forme de QueryParams
                queryParams: {
                  "email": "example@gmail.com",
                  "age": "33",
                  "place": "Japan",
                },
              ),
              child: const Text("Go to Settings page"),
            ),
          ],
        ),
      ),
    );
  }
}
