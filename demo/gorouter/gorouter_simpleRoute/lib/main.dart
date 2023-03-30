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




