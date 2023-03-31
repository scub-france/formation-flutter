import 'package:flutter/material.dart';


//ROUTE AVEC PARAMETRE
void main() {
  runApp(const MyApp());
}


final router = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
        path: "/home",
        builder: (context, state) => const HomePage()),
    GoRoute(
      //Nous passons 'name' en parametre de la route
      path: "/settings/:name",
      //Dans le constructeur du Widget que nous appelons, nous prenons la variable que nous avons créée dans le Widget
      builder: (context, state) => SettingPage(
        name: state.params["name"]!,
      ),
    )
  ],
);

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




