import 'package:flutter/material.dart';

import 'app_router.dart';


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




