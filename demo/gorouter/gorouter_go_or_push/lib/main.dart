import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// GO VS PUSH
void main() {
  runApp(const GoRouterApp());
}

// Nous configurons ici les routes de notre application

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    // top-level route
    //Quand on visite la route /, GoRouter renvoie vers le widget HomeScreen
    GoRoute(path: "/", builder: (context, state) => const HomeScreen(), routes: [
      // une sub-route
      GoRoute(
        path: "detail",
        builder: (context, state) => const DetailScreen(),
      ),

      // une autre sub-route
      GoRoute(
        path: "modal",
        builder: (context, state) => const ModalScreen(),
      ),
    ]),
    // une autre top-level route
    GoRoute(
      path: "/settings",
      builder: (context, state) => const SettingPage(),
    )
  ],
);

class GoRouterApp extends StatelessWidget {
  const GoRouterApp({super.key});

  @override
  build(context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Test GoRouter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              // Ici, vous pouvez voir qu'en appuyant sur le bouton, nous irons dans '/detail'.
              // La route définie ici doit être identique au nom qui a été écrit à l'endroit où vous avez configuré les routes
              onPressed: () => context.go('/detail'),
              child: const Text('DetailScreen with go', textAlign: TextAlign.center),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () => context.push('/detail'),
              child: const Text('DetailScreen with push', textAlign: TextAlign.center),
            ),const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () => context.go('/settings'),
              child: const Text('SettingsPage with go', textAlign: TextAlign.center),
            ),
            //Le premier et le second callback ont le même emplacement cible (/detail) et se comportent donc de la même manière.
            // En d'autres termes, dans les deux cas, nous obtiendrons deux routes dans la pile de navigation (home → detail).
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Screen'), backgroundColor: Colors.green),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  //Ici on va afficher l'écran modal par dessus l'écran home
                  //go ne garde pas la route précédente
                  onPressed: () => context.go('/modal'),
                  child: const Text('Go /modal', textAlign: TextAlign.center),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text("La stack de navigation sera : home -> modal ", textAlign: TextAlign.center)
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              //Ici on va afficher l'écran modal par dessus l'écran detail
              //push préserve la stack de navigation
              ElevatedButton(
                onPressed: () => context.push('/modal'),
                child: const Text('Push /modal', textAlign: TextAlign.center),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text("La stack de navigation sera : home -> detail -> modal ", textAlign: TextAlign.center,)
            ])
          ],
        ),
      ),
    );
  }
}

class ModalScreen extends StatelessWidget {
  const ModalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Modal Screen', textAlign: TextAlign.center), backgroundColor: Colors.amber),
        body: const Center(child: Text("Nous sommes sur l'écran Modal", textAlign: TextAlign.center)));
  }
}

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setting Page', textAlign: TextAlign.center)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              // Vérifier l'itinéraire qui a été défini pour '/'.
              onPressed: () => context.go('/'),
              child: const Text('Go to home'),
            ),
          ],
        ),
      ),
    );
  }
}