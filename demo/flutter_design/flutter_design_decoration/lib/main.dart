import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Demonstration de techniques de Design avec DecoratedBox
class DecoratedApp extends StatelessWidget {
  const DecoratedApp({super.key});

  @override
  build(_) => SizedBox(
        width: 300,
        // Calcul de la hauteur en respectant un ratio 3/4
        child: AspectRatio(
          aspectRatio: 3 / 4,
          // Widget responsable du Design
          child: DecoratedBox(
              position: DecorationPosition.background,
              decoration: BoxDecoration(
                  backgroundBlendMode: BlendMode.multiply,
                  gradient: LinearGradient(
                      // Définir la direction de notre gradient
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      // Couleur de départ et arrivée
                      colors: [
                        Color.lerp(const Color(0xFFB39DDB), Colors.white70, .7)!,
                        const Color(0xFFB39DDB),
                        const Color(0xFFB3EEDB)
                      ],
                      // Décalage du dégradé, on donne plus d'espace à la couleur
                      // de départ (.25) et on finit plus tôt (.95)
                      // Le tableau correspond au nombre de couleurs
                      stops: const [0, .25, .95],
                      // Rotation de notre gradient par Transformation
                      transform: const GradientRotation(pi / 6)),
                  // Ajoutons 2 ombres superposés
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.normal,
                      // Niveau de diffusion
                      blurRadius: 4.4,
                      // Décalage par le bas et à droite
                      offset: const Offset(6, 6),
                      // Couleur de l'ombre
                      color: Color.lerp(const Color(0xFFB39DDB), Colors.black, .05)!,
                    ),
                    BoxShadow(
                      blurStyle: BlurStyle.outer,
                      // Niveau de diffusion
                      blurRadius: 1.4,
                      // Décalage par le bas et à droite
                      offset: const Offset(3, 3),
                      // Couleur de l'ombre
                      color: Color.lerp(const Color(0xFFB39DDB), Colors.black, .08)!,
                    ),
                  ],

                  // Définition des bordures
                  border: Border.all(
                      color: const Color(0xFFB39DDB),
                      width: 1.8,
                      style: BorderStyle.solid,
                      // Dessin à l'extérieur du chemin
                      strokeAlign: BorderSide.strokeAlignOutside),

                  // Tous les angles sont arrondis
                  // Si possible travailler avec des multiples de 8: 16, 24, 32
                  borderRadius: const BorderRadius.all(Radius.circular(16))),
              child: Center(
                child: Text(
                  "Miroir",
                  // On importe la fonte directement depuis Google
                  style: GoogleFonts.dancingScript()
                      .copyWith(color: Colors.white70, fontWeight: FontWeight.w700, fontSize: 75),
                ),
              )),
        ),
      );
}

void main() => runApp(const MaterialApp(
        home: Scaffold(
            body: Center(
      child: DecoratedApp(),
    ))));
