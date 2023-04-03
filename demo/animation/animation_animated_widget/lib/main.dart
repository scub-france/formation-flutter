import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Les Widgets animés sont widgets qui fournissent une mécanique d'animation d'attributs
/// Ils sont plus simples à mettre en oeuvre dans les scénarios
void main() => runApp(const AnimationApp());

class AnimationApp extends StatelessWidget {
  const AnimationApp({super.key});

  @override
  build(context) => const MaterialApp(
        title: 'Animation simple',
        home: esfzef(),
      );
}

class SpinningContainer extends AnimatedWidget {
  const SpinningContainer({
    super.key,
    // Passer en paramètre le contrôleur
    required AnimationController controller,
  })
  // controller est de type [Listenable], on peut s'y abonner pour recevoir les MAJ
  // et donc mettre à jour l'animation
  : super(listenable: controller);

  // Note animation est typée, elle va produire unique un double
  Animation<double> get _progress => listenable as Animation<double>;

  @override
  build(context) =>
      // Transform est un Widget qui propose plusieurs mode
      // Ici nous choisissons directement une rotation
      Transform.rotate(
        // 2 Pi c'est une rotation complète à 360°
        // si l'animation est à 0.1 alors notre rotation est à 10%
        // la répétition permet une rotation permanente
        angle: _progress.value * 2.0 * math.pi,
        child: const ColoredBox(color: Colors.red),
      );
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// [AnimationController] repose sur la propriété
/// vsync qui se trouve dans le Mixin [TickerProviderStateMixin]
/// Le Ticker est l'horloge système, elle nous prévient du timing en fonction des frames
class _MyStatefulWidgetState extends State<MyStatefulWidget> with TickerProviderStateMixin {
  // Définition et contrôle de notre animation
  late final _controller = AnimationController(
    // L'animation est exécutée sur une période totale de 10 secondes.
    // Le controller passera de la valeur 0 à la valeur 1 en 10 secondes
    duration: const Duration(seconds: 10),
    // this fait référence à TickerProviderStateMixin
    vsync: this,
  )
    // Répétition à l'infinie
    ..repeat();

  @override
  void dispose() {
    // Ne pas oublier de disposer le contrôleur pour éviter les fuites de mémoire
    _controller.dispose();
    super.dispose();
  }

  @override
   build(context) => SpinningContainer(controller: _controller);

}
