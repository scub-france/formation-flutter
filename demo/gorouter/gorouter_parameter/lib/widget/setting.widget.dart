import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingPage extends StatelessWidget {
  //Nous avons besoin d'une variable que nous avons définie dans l'itinéraire.
  //Ici, il s'agit de 'name'
  final String name;
  const SettingPage({super.key, required this.name});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Ici, nous utilisons la variable
      appBar: AppBar(title: Text(name)),
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