import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(const PointerEventApp());

/// Cet exemple affiche deux widgets
///
/// Le Widget1 contient un Texte dont la taille est modifiable grace
/// a la molette de la souris.
///
/// Le Widget2 comprend un compteur du nombres de presses sur la souris,
/// un compteur de releases ainsi que la position du curseur.
///
/// La couleur du widget dépend de la position du curseur.

class PointerEventApp extends StatelessWidget {
  const PointerEventApp({super.key});

  static const String _title = 'Flutter PointerEvent';

  @override
  build(context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: PrincipalWidget(),
        ),
      ),
    );
  }
}

class PrincipalWidget extends StatefulWidget {
  const PrincipalWidget({super.key});

  @override
  State<PrincipalWidget> createState() => _PrincipalWidgetState();
}

/// Notre widget principal
class _PrincipalWidgetState extends State<PrincipalWidget> {

  // Compteur des presses
  int _downCounter = 0;

  // Compteur des releases
  int _upCounter = 0;

  // Position du curseur
  double x = 0.0;
  double y = 0.0;

  // Couleur par défaut des widgets 1 et 2
  Color couleurWidget1 = Colors.deepOrangeAccent;
  Color couleurWidget2 = Colors.deepOrangeAccent;

  // Taille par défaut du texte
  double tailleTexte = 18.0;

  /// incrémente _downCounter et appelle _updateLocation
  void _incrementDown(_) {
    _updateLocation(_);
    setState(()=>_downCounter++);
  }

  /// incrémente _upCounter et appelle _updateLocation
  void _incrementUp(_) {
    _updateLocation(_);
    setState(() => _upCounter++);
  }

  /// met a jour x et y avec les valeurs de la position du curseur
  void _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  /// met a jour la couleur d'un widget quand le curseur le quitte
  void _exitAction(PointerEvent details) {
    // On se sert du paramètre buttons pour identifier  un événement
    if (details.buttons == 1) {
      setState(() => couleurWidget1 = Colors.deepOrangeAccent);
    }
    if (details.buttons == 2) {
      setState(() => couleurWidget2 = Colors.deepOrangeAccent);
    }
  }

  /// met a jour la couleur d'un widget quand le curseur est en dessus
  void _hoverAction(PointerEvent details) {
    // On se sert du paramètre buttons pour identifier  un événement
    if (details.buttons == 1) {
      setState(() => couleurWidget1 = Colors.greenAccent);
    }
    if (details.buttons == 2) {
      setState(() => couleurWidget2 = Colors.greenAccent);
    }
  }

  /// Permet de changer la taille du texte en manipulons la molette de la souris
  void _signalAction(PointerScrollEvent details) => setState(() {
        double taille = tailleTexte;
        // taille minimale du Text == 8 pour éviter que le widget disparaisse
        if (details.scrollDelta.dy > 0 && taille >= 8) {
          taille = taille - 1;
        }
        if (details.scrollDelta.dy < 0) {
          taille = taille + 1;
        }
        setState(() => tailleTexte = taille);
      });

  @override
  build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // widget1
        DecoratedBox(
            decoration: BoxDecoration(color: couleurWidget1),
            child: Listener(
              // capturer les évènements de la molette de la souris
              onPointerSignal: (signal) =>
                  _signalAction(signal as PointerScrollEvent),

              // les méthodes de Listener ne répondent pas a tout nos besoins
              // c'est pour cela qu'on a besoin de MouseRegion
              child: MouseRegion(
                  onEnter: (_) =>
                      _hoverAction(const PointerHoverEvent(buttons: 1)),
                  onExit: (_) =>
                      _exitAction(const PointerHoverEvent(buttons: 1)),
                  child: Text(
                    'Taille modifiable',
                    style: TextStyle(fontSize: tailleTexte),
                  )),
            )),

        // Widget2
        ConstrainedBox(
          constraints: BoxConstraints.tight(const Size(300.0, 200.0)),
          child: Listener(
            onPointerDown: _incrementDown,
            onPointerMove: _updateLocation,
            onPointerUp: _incrementUp,
            onPointerHover: (_) =>
                _hoverAction(const PointerHoverEvent(buttons: 2)),
            child: MouseRegion(
              onEnter: (_) => _hoverAction(const PointerHoverEvent(buttons: 2)),
              onExit: (_) => _exitAction(const PointerHoverEvent(buttons: 2)),
              child: Container(
                color: couleurWidget2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Vous avez effectué le nombre de pressions ou '
                        'libérations suivant:'),
                    Text(
                      '$_downCounter pressions\n$_upCounter libérations',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      'Position du curseur: (${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
