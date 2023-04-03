import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  build(context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Text("Tab1"),
                Text("Tab2"),
              ],
            ),
            title: const Text('Tabs KeepAlive Demo'),
          ),
          body:
          const TabBarView(
            children: [
              BarApp(),
              BarApp(),
            ],
          ),
        ),
      ),
    );
  }
}

class BarApp extends StatefulWidget {
  const BarApp({super.key});

  @override
  State<BarApp> createState() => _BarApp();
}

class _BarApp extends State<BarApp>
    with AutomaticKeepAliveClientMixin<BarApp> {
  late int affichage;
  late bool isKeepAlive;
  @override
  build(context) {
    super.build(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(isKeepAlive ? "Le widget est detruit quand il n'est plus visible, un autre widget est reconsruit a chaque fois": "Le widget est maintenu en vie"),
          Text(affichage.toString(),style:const  TextStyle (color :  Colors .green, fontSize :  100 )),
          GestureDetector(
            onTap: () => setState(() {
              isKeepAlive=!isKeepAlive;
              updateKeepAlive();
            }),
            child: Center(
              child: DecoratedBox(
                decoration: const BoxDecoration(color:Colors.blue),
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: Center(
                    child: isKeepAlive ? const Text("Desactiver keepAlive") : const Text("activer keepAlive") ,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  @override
  bool get wantKeepAlive => isKeepAlive;

  @override
  void initState() {
    affichage=Random().nextInt(1000);
    isKeepAlive=false;
    super.initState();
  }
}
