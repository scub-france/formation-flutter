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
  // Suivre le nombres de clic
  int _compteur = 0;

  // setState demande la mise à jour de notre affichage avec les valeurs à jour
  void _incrementer() => setState(() => _compteur++);

  // Configurer ce qui sera dessiner à l'écran
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compteur')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TitreDeCompteur(),
            Text('$_compteur', style: Theme.of(context).textTheme.headline4),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementer,
        tooltip: 'Incrémenter',
        child: const Icon(Icons.add),
      ),
    );
  }
}

/// Contenu permanent
class TitreDeCompteur extends StatelessWidget {
  const TitreDeCompteur({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Compteur de clics');
  }
}
