import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingPage extends StatelessWidget {
  //Je crée une variable 'name' car cette variable sera necessaire pour la mettre en parametre
  final String name;
  // Dans le constructeur, nous mettons ce paramètre en 'requis'
  const SettingPage({super.key, required this.name});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setting Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go to home'),
            ),
          ],
        ),
      ),
    );
  }
}