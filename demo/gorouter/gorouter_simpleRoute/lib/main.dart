import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widget/home.widget.dart';
import 'widget/setting.widget.dart';


//SIMPLE ROUTE
void main() {
  runApp(const MyApp());
}

// Nous définissons ici les routes
// Il s'agit d'une route simple pour naviguer entre HomePage et SettingPage
// Attention : ici, nous avons défini des itinéraires, mais nous devons les appeler là où nous en avons besoin.
final _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/settings",
      builder: (context, state) => const SettingPage(),
    )
  ],
);

// Ce widget est la racine de votre application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // RouterConfig permet de définir la configuration du routeur de l'application.
  // Ici, nous lui passons "_router" qui est un objet de GoRouter.
  // Cet objet est configuré avec la liste des routes à gérer et d'autres paramètres de configuration comme le mode de navigation
  @override
  build(context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'router Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}




