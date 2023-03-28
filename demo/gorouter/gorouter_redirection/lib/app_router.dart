import 'package:go_router/go_router.dart';

import 'widget/home.widget.dart';
import 'widget/login.widget.dart';


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
