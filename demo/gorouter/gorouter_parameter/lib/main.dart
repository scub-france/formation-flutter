import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


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


class SettingPage extends StatelessWidget {
  //Nous avons besoin d'une variable que nous avons définie dans l'itinéraire.
  //Ici, il s'agit de 'name'
  final String name;
  const SettingPage({super.key, required this.name});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Ici, nous utilisons la variable
      appBar: AppBar(title: Text(name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: const Text('Go to home'),
            ),
          ],
        ),
      ),
    );
  }
}




