import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';




//ROUTE AVEC ITINERAIRES
void main() {
  runApp(const MyApp());
}


//Pour cet exemple, nous avons nommé la route initiale /home
final router = GoRouter(
  //nous devons ajouter initialLocation pour indiquer à notre application que la route par défaut n'est plus "/" mais, dans notre cas, "/home".
  //Sans cela, Flutter ira à "/" lors de l'ouverture de l'application.
  initialLocation: "/home",
  //Maintenant, faites attention à l'indentation des choses.
  //Ici, notre premier GoRoute ne se ferme pas après avoir appelé le HomePage Widget.
  //Nous avons établi une autre route à l'intérieur de la première route.
  //Point important, ne pas mettre de '/' avant le sous-itinéraire.
  routes: [
    GoRoute(
        path: "/home",
        builder: (context, state) => const HomePage(),
        routes : [
          GoRoute(
            path: "settings",
            builder: (context, state) => const SettingPage(),
          )
        ]
    ),
  ],
);


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  build(context) {
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              //Afin de respecter les routes définies par go_router, qui appelle setting.widget en tant que sous-route de home.widget,
              //nous devons le spécifier lors de l'appel de la méthode
              onPressed: () => context.go('/home/settings'),
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setting Page')),
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


