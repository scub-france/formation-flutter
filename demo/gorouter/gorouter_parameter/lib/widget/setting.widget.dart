import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingPage extends StatelessWidget {
  //We need a variable that we have defined in the route.
  //Herre it is 'name'
  final String name;
  const SettingPage({super.key, required this.name});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Here we use this variable
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