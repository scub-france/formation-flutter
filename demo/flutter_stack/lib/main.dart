import 'package:flutter/material.dart';

void main() => runApp(const StackApp());

class StackApp extends StatelessWidget {
  const StackApp({super.key});

  static const header = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  @override
  build(_) {
    return MaterialApp(
        // TODO pas le bon titre
        title: 'Layout et mise en page',
        home: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Comment("Stack comportement par défault", style: header),
              rowStack(),
              const Comment("Stack avec la modification du paramètre Alignement", style: header),
              rowStackWithAlign(),
              const Comment("Stack avec le widget Positioned", style: header),
              rowStackPositioned(),
              const Comment("Stack avec la modification du paramètre fit", style: header),
              rowStackWithFit(),
            ],
          ),
        ));
  }

  /// Crée une ligne avec 3 [Stack], passe en paramètre l'alignement de la [Stack]
  Widget rowStack() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // [Stack] permet de superposer des widgets
          Stack(
            children: <Widget>[
              // Ce calque est affiché à l'arrière
              calque(100, 100, Colors.red),
              calque(80, 80, Colors.green),
              // Celui-ci est affiché au dessus des autres
              calque(60, 60, Colors.blue),
            ],
          ),
          Stack(
            children: <Widget>[
              cercle(50, Colors.red),
              cercle(40, Colors.green),
              cercle(30, Colors.blue),
            ],
          ),
          Stack(
            children: <Widget>[
              calque(100, 100, Colors.red),
              cercle(50, Colors.cyan),
              cercle(40, Colors.green),
              cercle(30, Colors.blue),
            ],
          ),
        ],
      );

  /// Crée une ligne avec 3 [Stack], est utiliser Alignement disponible dans [Stack] pour placer nos widgets
  /// Les sous-composants sont positionnés en fonction de la propriété d'alignement
  /// alignement disponible dans [Stack] :
  /// [Alignment.topLeft], [Alignment.topCenter], [Alignment.topRight], [Alignment.centerLeft],
  /// [Alignment.center], [Alignment.centerRight], [Alignment.bottomLeft], [Alignment.bottomCenter], [Alignment.bottomRight]
  Widget rowStackWithAlign() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// [Stack] permet de superposer des widgets
          Column(
            children: [
              const Comment("top Right"),
              Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  calque(100, 100, Colors.red),
                  calque(80, 80, Colors.green),
                  calque(60, 60, Colors.blue),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Comment("bottom Center"),
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  cercle(50, Colors.red),
                  cercle(40, Colors.green),
                  cercle(30, Colors.blue),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Comment("bottom Left"),
              Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  calque(100, 100, Colors.red),
                  cercle(50, Colors.cyan),
                  cercle(40, Colors.green),
                  cercle(30, Colors.blue),
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
              const Comment("blue right :0"),
              Stack(
                children: <Widget>[
                  calque(100, 100, Colors.red),
                  calque(80, 80, Colors.green),
                  Positioned(
                    right: 0,
                    child: calque(60, 60, Colors.blue),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Comment("blue top:0"),
              Stack(
                children: <Widget>[
                  cercle(50, Colors.red),
                  cercle(40, Colors.green),
                  Positioned(top: 0, child: cercle(30, Colors.blue)),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Comment("green bottom:0"),
              Stack(
                children: <Widget>[
                  calque(100, 100, Colors.red),
                  cercle(50, Colors.cyan),
                  Positioned(bottom: 0, child: cercle(40, Colors.green)),
                  cercle(30, Colors.blue),
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
              const Comment("StackFit.expand"),
              SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    calque(100, 100, Colors.red),
                    calque(80, 80, Colors.green),
                    calque(60, 60, Colors.blue),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              // TODO remplacer le texte par la vraie enum
              Comment(StackFit.passthrough.name),
              SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  fit: StackFit.passthrough,
                  children: <Widget>[
                    cercle(50, Colors.red),
                    cercle(40, Colors.green),
                    cercle(30, Colors.blue),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Comment("StackFit.loose"),
              SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  fit: StackFit.loose,
                  children: <Widget>[
                    calque(100, 100, Colors.red),
                    cercle(50, Colors.cyan),
                    cercle(40, Colors.green),
                    cercle(30, Colors.blue),
                  ],
                ),
              ),
            ],
          ),
        ],
      );

  /// Crée un rectangle grâce à [DecoratedBox] de la color donnée et de la taille donnée grâce à [SizedBox]
  Widget calque(int height, int width, Color color) => SizedBox(
      height: height.toDouble(),
      width: width.toDouble(),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color),
      ));

  /// Crée un cercle grâce à [CircleAvatar] de la taille et color donnée
  Widget cercle(int radius, Color color) => CircleAvatar(
        radius: radius.toDouble(),
        backgroundColor: color,
      );
}

/// Aide à la description
class Comment extends StatelessWidget {
  const Comment(this.content,
      {super.key,
      this.style = const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.w300,
      )});

  final TextStyle style;
  final String content;

  @override
  build(_) => Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Text(content, style: style),
      );
}
