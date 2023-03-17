import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              //Here, the button will send us to the 'settings/:name' page.
              // If you change 'name' in the URL to a string, you will see this one appear in the AppBar
              onPressed: () => context.go('/settings/:name'),
              child: const Text('Go to the setting Page'),
            ),
          ],
        ),
      ),
    );
  }
}