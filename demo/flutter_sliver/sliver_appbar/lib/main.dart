import 'package:flutter/material.dart';

/// Cette démo illustre l'intégration d'une SliverAppBar dans un CustomScrollView, où elle est souvent utilisée comme premier enfant.
/// C'est une barre d'application qui peut varier en fonction du défilement de la CustomScrollView.
/// Elle peut varier en hauteur et/ou juste flotter au dessus du contenu.
/// SliverAppBar est à comparer à SliverPersistentHeader.
void main() => runApp(const SliverAppBarApp());

class SliverAppBarApp extends StatelessWidget {
  const SliverAppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Sliver Appbar',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              background: FlutterLogo(),
            ),
          ),
          /// SliverToBoxAdapter est ici uniquement utilisé pour permettre de scroller l'écran
          /// en augmentant la hauteur de la zone inférieur du CustomScrollView
          SliverToBoxAdapter(
            child: SizedBox(
              height: 1500,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.1,
                    0.4,
                    0.6,
                    0.9,
                  ],
                  colors: [
                    Color.fromRGBO(84, 197, 248, 1),
                    Color.fromRGBO(17, 78, 105, 1.0),
                    Color.fromRGBO(60, 121, 148, 1.0),
                    Color.fromRGBO(42, 177, 238, 1.0),
                  ],
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
