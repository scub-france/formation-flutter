import 'package:flutter/material.dart';

/// Cette démo illustre l'intégration du SliverList dans un CustomScrollView.
/// SliverList est un silver qui permet de construire une liste de widget scrollable.
/// Les éléments de SliverList peuvent être de dimension différentes.
/// SliverList est à comparer à SliverFixedExtentList.
void main() => runApp(SliverListApp());

class SliverListApp extends StatelessWidget {
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
  Widget _buildList(String _text) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [
          0.1,
          0.9,
        ],
        colors: [
          Colors.black26,
          Colors.black12,
        ],
      )),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0),
        child: Text(
          _text,
          style: const TextStyle(color: Colors.black, fontSize: 16),
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
          SliverList(
            /// SliverChildListDelegate est rempli de widget dont le contenu est différent.
            /// Il faut noter que chaque widget aura une hauteur en fonction de son contenu.
            delegate: SliverChildListDelegate([
              _buildList("List item 1"),
              _buildList("List item 2"),
              _buildList(
                  "List item 3. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pretium risus at auctor iaculis. Donec viverra diam id odio hendrerit, sit amet maximus felis mattis. "),
              _buildList("List item 4"),
              _buildList("List item 5"),
            ]),
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
