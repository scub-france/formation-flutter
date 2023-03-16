import 'dart:math';

import 'package:flutter/material.dart';

// Démarrer notre application
void main() => runApp(const SansEtat());

/// Un widget qui affiche un contenu permanent
class SansEtat extends StatelessWidget {
  const SansEtat({super.key});

  // Le résultat est toujours le même
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Widget et états',
      home: CompteurPage(),
    );
  }
}

/// Widget avec état qui maintient un compteur
class CompteurPage extends StatefulWidget {
  const CompteurPage({super.key});

  @override
  State<CompteurPage> createState() => _CompteurPageState();
}

/// Définition de l'état qui contient un compteur
class _CompteurPageState extends State<CompteurPage> {
  String _resultat = getRandom();

  // List de mots
  static Iterable<String> mots=["Scub","Web","Flutter","Dart","widget","provider","GO Router"];

  // setState demande la mise à jour de notre affichage avec les valeurs à jour
  void _changer() => setState(() => _resultat=getRandom());

  // retourne un mot aleatoire
  static String getRandom()=>mots.elementAt(Random().nextInt(mots.length));
  // Configurer ce qui sera dessiner à l'écran
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mot aléatoire")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TitreDeCompteur(),
            Text(_resultat, style: Theme.of(context).textTheme.headline4),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changer,
        tooltip: 'Nouveau tirage',
        child: const Icon(Icons.update),
      ),
    );
  }
}

/// Contenu permanent
class TitreDeCompteur extends StatelessWidget {
  const TitreDeCompteur({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Resultat:');
  }
}
