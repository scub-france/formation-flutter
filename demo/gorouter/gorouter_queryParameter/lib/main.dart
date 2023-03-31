import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



// PARAMETRE DE REQUETE => QUERY PARAMS
void main() {
  runApp(const MyApp());
}


final _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      // Nom de la route pour pouvoir y accéder avec `context.goNamed('settings', ...)`
      name: "settings",
      // Le paramètre `name` est obligatoire, les autres sont optionnels
      path: "/settings/:name",
      builder: (context, state) {
        // Affiche les paramètres de la requête dans la console
        //Lorsque vous êtes sur la page Setting et que vous basculez vers home, regarder dans la console et l'URL
        state.queryParams.forEach((key, value) {
          print("$key:$value");
        });
        // Retourne la page Setting en utilisant le nom de la route et les paramètres de l'état actuel
        return SettingPage(
          name: state.params["name"]!,
        );
      },
    ),
  ],
);


class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'router Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

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

class SettingPage extends StatelessWidget {
  //Je crée une variable 'name' car cette variable sera necessaire pour la mettre en parametre
  final String name;
  // Dans le constructeur, nous mettons ce paramètre en 'requis'
  const SettingPage({super.key, required this.name});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setting Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go to home'),
            ),
          ],
        ),
      ),
    );
  }
}
