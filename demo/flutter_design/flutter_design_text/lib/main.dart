// Nous devons importer le package auto_size_text
// pour pouvoir utiliser le widget AutoSizeText 👇
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Configure le rendu de vos textes à l'échelle d'une application
void main() {
  // Configuration d'un premier TextTheme qui sera appliqué à la racine
  final textTheme = TextTheme(
      // Avec précision nous choisissons la fonction puis définissons son rendu
      displayMedium: const TextStyle(
        fontFamily: 'Verdana',
        fontSize: 22,
        color: Colors.blueGrey,
        letterSpacing: 4,
      ),
      displayLarge: const TextStyle(
        fontFamily: 'Verdana',
        fontSize: 22,
        color: Colors.blueGrey,
        fontWeight: FontWeight.w500,
        // Souligné avec pointillés
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.dashed,
        height: 35,
        letterSpacing: 4, // espacement entre les lettres
      ),
      displaySmall: const TextStyle(
          fontFamily: 'Verdana',
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w900,
          backgroundColor: Colors.blueGrey,
          fontStyle: FontStyle.italic,
          shadows: [Shadow(offset: Offset(3.0, 3.0))]),
      labelSmall: const TextStyle(
        color: Colors.blueAccent,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Verdana',
        fontSize: 18,
        // Incompatible avec le web mais OK pour certaines Plateformes
        fontVariations: const [ui.FontVariation("slnt", 20)],
        // Cette partie peut ne pas bien rendre en mode web
        // Un object Paint est crée pour configurer tous les modes de rendus imaginables
        // C'est le plus avancé
        background: Paint()
          ..isAntiAlias = true
          ..blendMode = BlendMode.darken
          ..shader = kIsWeb
              ? ui.Gradient.radial(const Offset(10, 0), 35, [
                  Colors.orangeAccent,
                  Colors.blueAccent,
                ])
              : const LinearGradient(
                  colors: [
                    Colors.orangeAccent,
                    Colors.cyan,
                  ],
                ).createShader(Rect.fromPoints(Offset.zero, const Offset(5, 5))),
      ));

  return runApp(MaterialApp(
    theme: ThemeData(
        // Dès la racine nous définissons le rendu global
        textTheme: textTheme),
    home: const Scaffold(body: TextApp()),
  ));
}

class TextApp extends StatelessWidget {
  const TextApp({super.key});

  @override
  build(context) => Column(
        children: [
          const Card(
            child: ListTile(
              title: Text("Style Manuel", style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.w400)),
              subtitle: Text("Définition au niveau du widget"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Style Hérité", style: Theme.of(context).textTheme.displayMedium),
              subtitle: const Text("Définition depuis le Theme global"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Style Marqué", style: Theme.of(context).textTheme.displaySmall),
              subtitle: const Text("Avec une Ombre projeté"),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Style Paint", style: Theme.of(context).textTheme.titleSmall),
              subtitle: const Text("Un rendu avancé avec Paint()"),
            ),
          ),
          const Card(
            child: ListTile(
              // Une composition de morceaux de texte pour un rendu riche et interactif
              title: ActiveSpan(),
              subtitle: Text("Text Riche"),
            ),
          ),
        ],
      );
}

class ActiveSpan extends StatefulWidget {
  const ActiveSpan({Key? key}) : super(key: key);

  @override
  State<ActiveSpan> createState() => _ActiveSpanState();
}

class _ActiveSpanState extends State<ActiveSpan> {
  bool activated = false;

  @override
  build(context) => RichText(
          // Voici un span parent avec son propre style
          text: TextSpan(text: 'Composition de ', style: const TextStyle(color: Colors.black, fontSize: 18), children: [
        TextSpan(text: 'parties cliclable: ', style: const TextStyle(color: Colors.orange, fontSize: 18), children: [
          TextSpan(
              text: ' #activable',
              style:
                  Theme.of(context).textTheme.labelSmall!.copyWith(color: activated ? Colors.green : Colors.blueAccent),
              // Une méthode pour créer un lien sur une partie de texte
              recognizer: TapGestureRecognizer()..onTap = () => setState(() => activated = !activated)),
          const TextSpan(text: '😋', style: TextStyle(fontSize: 20, color: Colors.deepPurple))
        ]),
      ]));
}
