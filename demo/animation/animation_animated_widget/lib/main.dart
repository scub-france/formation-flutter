import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() => runApp(const AnimationApp());

class AnimationApp extends StatelessWidget {
  const AnimationApp({super.key});

  @override
  Widget build(context) => const MaterialApp(
        title: 'Animation simple',
        home: MyStatefulWidget(),
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

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(context) =>
      // Transform est un Widget qui implémente plusieurs mouvement
      // Ici nous choisissons directement la rotation
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
class _MyStatefulWidgetState extends State<MyStatefulWidget> with TickerProviderStateMixin {
  // Définition et contrôle de notre animation
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    // this fait référence à TickerProviderStateMixin
    vsync: this,
  )
    // Répétition
    ..repeat();

  @override
  void dispose() {
    // Ne pas oublié de disposer le contrôleur pour éviter les fuites de mémoire
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return SpinningContainer(controller: _controller);
  }
}
