import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //When making the widget, we need the context in parameter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              //here you can see that by pressing the button we will go to '/settings'.
              //The route defined here must be identical to the name that was written where you generated the routes
              onPressed: () => context.go('/settings'),
              child: const Text('Go to the setting Page'),
            ),
          ],
        ),
      ),
    );
  }
}