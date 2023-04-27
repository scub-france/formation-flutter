import 'package:flutter/material.dart';

void main() => runApp(SliverPersistentHeaderApp());

class SliverPersistentHeaderApp extends StatelessWidget {
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (_, int index) {
                return ListTile(
                  title: Text('List item ${index + 1}'),
                );
              },
              childCount: 40,
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
          "SliverPersistentHeader title",
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