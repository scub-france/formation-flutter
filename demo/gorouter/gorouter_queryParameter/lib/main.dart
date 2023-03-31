import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter/widget/home.widget.dart';
import 'widget/setting.widget.dart';

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
