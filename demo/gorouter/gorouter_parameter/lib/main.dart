import 'package:flutter/material.dart';

import 'app_router.dart';


void main() {
  runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //routerConfig allows to define the router configuration of the application.
  // Here, we pass it "router" which is an object of GoRouter.
  // This object is configured with the list of routes to manage and other configuration parameters like the navigation mode
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




