import 'dart:math';
import 'package:flutter/material.dart';

/// Il s'agit ici d'une page avec une TabBar ou chaque tab affiche un nombre aléatoire
/// si on passe d'une tab a l'autre, le comportement naturel d'un tabBar est que l'etat
/// d'un tab est perdu quand il n'est plus affiché !
/// si on revient sur notre tab, il sera réinitialisé et une nouvelle valeur aléatoire sera
/// calculée....
/// on a ainsi ajouté un button pour activer/désactiver le keepAlive
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
          Text(isKeepAlive ?  "l'état du widget est maintenu" : "Le widget est réinitialisé a chaque affichage"),
          Text(affichage.toString(),style:const  TextStyle (color :  Colors .green, fontSize :  100 )),
          GestureDetector(
            onTap: () => setState(() {
              /// on change ici l'etat de notre AutomaticKeepAlive
              isKeepAlive=!isKeepAlive;
              /// Garantit que tous les ancêtres AutomaticKeepAlive sont en bon état
              updateKeepAlive();
            }),
            child: Center(
              child: DecoratedBox(
                decoration: const BoxDecoration(color:Colors.blue),
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: Center(
                    child: isKeepAlive ? const Text("Désactiver keepAlive") : const Text("activer keepAlive") ,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// c'est ici qu'on définie si notre tab sera sauvegardé ou non
  /// Si on veut que notre tab soit sauvegardé tout le temps, il suffit de remplacer
  /// isKeepAlive par true....
  @override
  bool get wantKeepAlive => isKeepAlive;

  @override
  void initState() {
    affichage=Random().nextInt(1000);
    /// l'etat de notre tab ne sera pas sauvegardé
    isKeepAlive=false;
    super.initState();
  }
}