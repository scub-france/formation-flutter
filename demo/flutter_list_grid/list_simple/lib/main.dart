import 'package:flutter/material.dart';

void main() {
  runApp(const ListSimpleApp());
}

class ListSimpleApp extends StatelessWidget {
  const ListSimpleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListSimpleApp"),
      ),
      body: const Center(
        child: Text("Content"),
      ),
    );
  }
}
