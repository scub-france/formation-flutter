import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


// GO VS PUSH
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


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
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
              // Ici, vous pouvez voir qu'en appuyant sur le bouton, nous irons dans '/settings'.
              // La route définie ici doit être identique au nom qui a été écrit à l'endroit où vous avez généré les routes
              onPressed: () => context.go('/settings'),
              child: const Text('Go to the setting Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  // Lors de la création du widget, nous avons besoin du contexte en paramètre
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setting Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              // Vérifier l'itinéraire qui a été défini pour '/'.
              // La route définie ici doit être identique au nom qui a été écrit à l'endroit où vous avez généré les routes
              onPressed: () => context.go('/'),
              child: const Text('Go to home'),
            ),
          ],
        ),
      ),
    );
  }
}




