import 'package:flutter/material.dart';

/// Cette démo illustre l'intégration d'un SliverPersistentHeader dans un CustomScrollView.
/// SliverPersistentHeader est un sliver dont la taille peut varier en fonction du défilement de la CustomScrollView.
/// Il est à comparer à SliverAppBar, qui dispose de plus de fonctionnalités.
/// Il s'agit de la primitive de layout que SliverAppBar utilise pour ses effets de distorsion.
void main() => runApp(const SliverPersistentHeaderApp());

class SliverPersistentHeaderApp extends StatelessWidget {
  const SliverPersistentHeaderApp({super.key});

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
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: MyDelegate(),
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


class MyDelegate extends SliverPersistentHeaderDelegate {

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.black54,
      child: const Center(
        child: Text(
          "SliverPersistentHeader",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}