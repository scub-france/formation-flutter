import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

// Variable pour savoir si l'utilisateur est connecté ou pas
var isLoggedIn = false;

// Création du router avec GoRouter
final router = GoRouter(
  // La méthode redirect est appelée avant chaque route pour vérifier si l'utilisateur est connecté
  redirect: (context, state) {
    if(isLoggedIn) // Si l'utilisateur est connecté, on le redirige vers la page d'accueil
        {
      return '/';
    }
    else // Si l'utilisateur n'est pas connecté, on le redirige vers la page de connexion
        {
      return '/login';
    }
  },
  // Définition des routes de l'application
  routes: [
    // Route pour la page d'accueil
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    // Route pour la page de connexion
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'router Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}


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
              onPressed: () => context.go('/login'),
              child: const Text('Go back to login'),
            ),
          ],
        ),
      ),
    );
  }
}

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




