import 'package:flutter/material.dart';

void main() => runApp(const Layout());

class Layout extends StatelessWidget {

  const Layout({super.key});

  @override
  build(_) => MaterialApp(
      title: 'Layout et mise en page',
      home: Scaffold(
        body: Column(
          /// [MainAxisAlignment.spaceEvenly] permet de répartir les enfants de la [Column] de manière égale
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// [Stack] avec [Alignment.topLeft] qui est l'alignement par défaut de [Stack]
            rowStack(Alignment.topLeft),
            /// [Stack] avec [Alignment.center] afin d'aligner les enfants au centre
            rowStack(Alignment.center),
          ],
        ),
      ));

  /// Crée une ligne avec 3 [Stack], passe en paramètre l'alignement de la [Stack]
  Widget rowStack(Alignment align) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      /// [Stack] permet de superposer des widgets
      Stack(
        alignment: align,
        children: <Widget>[
          buildStack(100, 100, Colors.red),
          buildStack(80, 80, Colors.green),
          buildStack(60, 60, Colors.blue),
        ],
      ),
      Stack(
        alignment: align,
        children: <Widget>[
          buildStackCircle(50, Colors.red),
          buildStackCircle(40, Colors.green),
          buildStackCircle(30, Colors.blue),
        ],
      ),
      Stack(
        alignment: align,
        children: <Widget>[
          buildStack(100, 100, Colors.red),
          buildStackCircle(50, Colors.cyan),
          buildStackCircle(40, Colors.green),
          buildStackCircle(30, Colors.blue),
        ],
      ),
    ],
  );

  /// Crée un rectangle grâce à [DecoratedBox] de la color donnée et de la taille donnée grâce à [SizedBox]
  Widget buildStack(int height, int width, Color color) => SizedBox(
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
