import 'package:flutter/material.dart';

void main() => runApp(SliverGridApp());

/// Cette démo illustre l'intégration du SliverGrid dans un CustomScrollView.
/// SliverGrid est un silver qui permet de construire une liste de widget scrollable, disposés en grille.
class SliverGridApp extends StatelessWidget {
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
  Widget _buildFixedList(Color color, String _text) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          _text,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

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
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,

            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
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
