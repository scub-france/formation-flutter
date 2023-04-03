import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_router.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Création d'un bouton pour se connecter
            ElevatedButton(
              // Lorsque l'utilisateur appuie sur le bouton
              onPressed: () {
                // La variable isLoggedIn passe à true pour indiquer que l'utilisateur est connecté
                // Vous pouvez essayer d'enlever cette ligne et essayer de cliquer sur le bouton pour voir le résultat
                isLoggedIn = true;
                // On utilise la méthode go() pour naviguer vers la page d'accueil (route '/')
                context.go('/');
              },
              child: const Text('Connexion'),
            ),
          ],
        ),
      ),
    );
  }
}

