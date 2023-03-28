import 'package:flutter/material.dart';

import 'app_router.dart';


void main() {
  runApp(const MyApp());
}

// Ce widget est la racine de votre application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // RouterConfig permet de définir la configuration du routeur de l'application.
  // Ici, nous lui passons "router" qui est un objet de GoRouter.
  // Cet objet est configuré avec la liste des routes à gérer et d'autres paramètres de configuration comme le mode de navigation
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




