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