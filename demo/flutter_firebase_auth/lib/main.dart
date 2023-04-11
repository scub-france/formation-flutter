import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

void main() => runApp(const FirebaseAuth());

class FirebaseAuth extends StatelessWidget {
  const FirebaseAuth({super.key});

  @override
  build(_) => MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _auth = MockFirebaseAuth();

  Future<void> _signInWithEmailAndPassword(String email, String password) async {
    try {
      final User user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Signed in: ${user.uid}');
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Sign In'),
              onPressed: () {
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();
                _signInWithEmailAndPassword(email, password);
              },
            ),
          ],
        ),
      ),
    );
  }
}
