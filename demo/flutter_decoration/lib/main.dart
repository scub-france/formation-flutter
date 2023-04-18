import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterDecoration());
}

class FlutterDecoration extends StatelessWidget {
  const FlutterDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('DecoratedBox 1'),
            SizedBox(
              width: 400,
              height: 200,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  border: Border.all(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Text('L\'enfant n°1 décoré'),
                ),
              ),
            ),
            const Text('DecoratedBox 2'),
            const SizedBox(
              width: 200,
              height: 200,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('images/background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                    child: Text('L\'enfant n°2 décoré',
                        style: TextStyle(color: Colors.white))),
              ),
            ),
            const Text('DecoratedBox 3'),
            const SizedBox(
              width: 400,
              height: 200,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue, Colors.red],
                  ),
                ),
                child: Center(child: Text('L\'enfant n°3 décoré')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
