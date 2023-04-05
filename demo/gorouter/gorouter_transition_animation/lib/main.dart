import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


// TRANSITION ANIMATION
void main() => runApp(RouterApp());

class RouterApp extends StatelessWidget {
  RouterApp({super.key});


  final _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        // Utilisation de pageBuilder pour construire la page d'accueil
        // en y ajoutant une animation de transition
        pageBuilder: (context, state) => CustomTransitionPage(
          // Utilisation de la clé de la page pour conserver son état lors de la navigation
            key: state.pageKey,
            // Ajout de la page d'accueil en tant qu'enfant de la page de transition
            child: HomePage(),
            // Utilisation de transitionsBuilder pour construire l'animation de transition
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              // Utilisation de ScaleTransition pour animer la page d'accueil en la faisant grossir
              return ScaleTransition(
                // Utilisation de Tween pour définir l'échelle de la page d'accueil
                scale: Tween<double>(begin: 0.0, end: 1.0)
                // Application d'une courbe d'animation pour rendre la transition plus fluide
                    .animate(CurvedAnimation(
                    parent: animation, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            }),
      ),
      GoRoute(
        path: "/settings",
        // Utilisation de pageBuilder pour construire la page setting
        // en y ajoutant une animation de transition
        pageBuilder: (context, state) => CustomTransitionPage(
          // Utilisation de la clé de la page pour conserver son état lors de la navigation
            key: state.pageKey,
            // Ajout de la page des paramètres en tant qu'enfant de la page de transition
            child: SettingPage(),
            // Utilisation de transitionsBuilder pour construire l'animation de transition
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              // Utilisation de FadeTransition pour animer la page des paramètres en changeant son opacité
              return FadeTransition(
                // Utilisation de CurveTween pour définir la courbe d'animation pour rendre la transition plus fluide
                opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            }),
      )
    ],
  );

  @override
  build(context) => MaterialApp.router(
        routerConfig: _router,
        title: 'router Demo',
      );
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
