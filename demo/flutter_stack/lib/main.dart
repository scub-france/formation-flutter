import 'package:flutter/material.dart';

void main() => runApp(const StackApp());

class StackApp extends StatelessWidget {
  const StackApp({super.key});

  @override
  build(_) => MaterialApp(
      title: 'Layout et mise en page',
      home: Scaffold(
        body: Column(
          /// [MainAxisAlignment.spaceEvenly] permet de répartir les enfants de la [Column] de manière égale
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Stack comportement par défault",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
            /// [Stack] avec [Alignment.topLeft] qui est l'alignement par défaut de [Stack]
            rowStack(),
            const Text("Stack avec la modification du paramètre Alignement",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
            /// [Stack] avec [Alignment.center] afin d'aligner les enfants au centre
            rowStackWithAlign(),
            const Text("Stack avec le widget Positioned",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
            rowStackPositioned(),
            const Text("Stack avec la modification du paramètre fit",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
            rowStackWithFit(),
          ],
        ),
      ));

  /// Crée une ligne avec 3 [Stack], passe en paramètre l'alignement de la [Stack]
  Widget rowStack() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// [Stack] permet de superposer des widgets
          Stack(
            children: <Widget>[
              buildLayer(100, 100, Colors.red),
              buildLayer(80, 80, Colors.green),
              buildLayer(60, 60, Colors.blue),
            ],
          ),
          Stack(
            children: <Widget>[
              buildStackCircle(50, Colors.red),
              buildStackCircle(40, Colors.green),
              buildStackCircle(30, Colors.blue),
            ],
          ),
          Stack(
            children: <Widget>[
              buildLayer(100, 100, Colors.red),
              buildStackCircle(50, Colors.cyan),
              buildStackCircle(40, Colors.green),
              buildStackCircle(30, Colors.blue),
            ],
          ),
        ],
      );

  /// Crée une ligne avec 3 [Stack], est utiliser Alignement disponible dans [Stack] pour placer nos widgets
  /// Les sous-composants sont positionnés en fonction de la propriété d'alignement
  /// algnement disponnible dans [Stack] :
  /// [Alignment.topLeft], [Alignment.topCenter], [Alignment.topRight], [Alignment.centerLeft],
  /// [Alignment.center], [Alignment.centerRight], [Alignment.bottomLeft], [Alignment.bottomCenter], [Alignment.bottomRight]
  Widget rowStackWithAlign() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// [Stack] permet de superposer des widgets
          Column(
            children: [
              const Text("top Right"),
              Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  buildLayer(100, 100, Colors.red),
                  buildLayer(80, 80, Colors.green),
                  buildLayer(60, 60, Colors.blue),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Text("bottom Center"),
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  buildStackCircle(50, Colors.red),
                  buildStackCircle(40, Colors.green),
                  buildStackCircle(30, Colors.blue),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Text("bottom Left"),
              Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  buildLayer(100, 100, Colors.red),
                  buildStackCircle(50, Colors.cyan),
                  buildStackCircle(40, Colors.green),
                  buildStackCircle(30, Colors.blue),
                ],
              ),
            ],
          ),
        ],
      );

  /// Crée une ligne avec 3 [Stack], est utiliser le widget [Positioned] pour placer dans chaque [Stack] un widget
  /// [Positioned] prend en paramètre :
  /// [top], [right], [bottom], [left] qui permettent de positionner le widget
  Widget rowStackPositioned() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// [Stack] permet de superposer des widgets
          Column(
            children: [
              const Text("blue right :0"),
              Stack(
                children: <Widget>[
                  buildLayer(100, 100, Colors.red),
                  buildLayer(80, 80, Colors.green),
                  Positioned(
                    right: 0,
                    child: buildLayer(60, 60, Colors.blue),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Text("blue top:0"),
              Stack(
                children: <Widget>[
                  buildStackCircle(50, Colors.red),
                  buildStackCircle(40, Colors.green),
                  Positioned(top: 0, child: buildStackCircle(30, Colors.blue)),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Text("green bottom:0"),
              Stack(
                children: <Widget>[
                  buildLayer(100, 100, Colors.red),
                  buildStackCircle(50, Colors.cyan),
                  Positioned(bottom: 0, child: buildStackCircle(40, Colors.green)),
                  buildStackCircle(30, Colors.blue),
                ],
              ),
            ],
          ),
        ],
      );

/// Crée une ligne avec 3 [Stack], ou nous allons utiliser le paramètre [fit] de [Stack]
  /// [fit] permet de définir le comportement de la [Stack] par rapport à ses enfants
  /// [StackFit.loose] fait le widget enfant occuper la taille minimale
  /// [StackFit.expand] fait le widget enfant occuper la taille maximale
  /// [StackFit.passthrough] fait le widget enfant occuper la taille son widget parent a défini
  Widget rowStackWithFit() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// [Stack] permet de superposer des widgets
          Column(
            children: [
              const Text("StackFit.expand"),
              SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    buildLayer(100, 100, Colors.red),
                    buildLayer(80, 80, Colors.green),
                    buildLayer(60, 60, Colors.blue),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Text("StackFit.passThrough"),
              SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  fit: StackFit.passthrough,
                  children: <Widget>[
                    buildStackCircle(50, Colors.red),
                    buildStackCircle(40, Colors.green),
                    buildStackCircle(30, Colors.blue),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Text("StackFit.loose"),
              SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  fit: StackFit.loose,
                  children: <Widget>[
                    buildLayer(100, 100, Colors.red),
                    buildStackCircle(50, Colors.cyan),
                    buildStackCircle(40, Colors.green),
                    buildStackCircle(30, Colors.blue),
                  ],
                ),
              ),
            ],
          ),
        ],
      );

  /// Crée un rectangle grâce à [DecoratedBox] de la color donnée et de la taille donnée grâce à [SizedBox]
  Widget buildLayer(int height, int width, Color color) => SizedBox(
      height: height.toDouble(),
      width: width.toDouble(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
        ),
      ));

  /// Crée un cercle grâce à [CircleAvatar] de la taille et color donnée
  Widget buildStackCircle(int radius, Color color) => CircleAvatar(
        radius: radius.toDouble(),
        backgroundColor: color,
      );
}
