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
      home: RandomWordPage(),
    );
  }
}

/// Widget avec état qui maintient un compteur
class RandomWordPage extends StatefulWidget {
  const RandomWordPage({super.key});

  @override
  State<RandomWordPage> createState() => _RandomWordPage();
}

/// Définition de l'état qui contient un compteur
class _RandomWordPage extends State<RandomWordPage> {
  String _resultat = getRandom("");
  late String _message;
  late Color _messageColor;

  /// Liste de mots
  static const Iterable<String> mots=["Scub","Web","Flutter","Dart","Widget","Provider","GO Router", "Stateful",
    "stateless", "Random", "createState", "build", "AppBar"];

  /// setState demande la mise à jour de notre affichage avec les valeurs à jour
  void _changer() => setState(() {
    _message= "setState()";
    _messageColor=Colors.deepPurple;
    _resultat=getRandom(_resultat);
  });

  /// retourne un mot aleatoire différent de la valeur de _resultat
  static String getRandom(String lastValue) {
    String newValue="";
    while(newValue==""){
      String randomValue=mots.elementAt(Random().nextInt(mots.length));
      newValue= lastValue != randomValue ? randomValue : "";
    }
    return newValue;
  }

  @override
  initState(){
    super.initState();
    _message="initState()";
    _messageColor=Colors.green;
  }

  /// Configurer ce qui sera dessiner à l'écran
  @override
  build(context)=> Scaffold(
      appBar: AppBar(title: const Text("Mots aléatoires !!!")),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Ce message nous parvient de la methode:"),
            Text(_message, style:  TextStyle(color: _messageColor, fontSize: 40)),
            const SizedBox(height: 100),
            const TitreDeSortiee(),
            Text(_resultat, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        /// Un clic sur ce button change l'état de notre widget grace a l'appel
        /// de la méthode _changer()
        onPressed: _changer,
        tooltip: 'Nouveau tirage',
        child: const Icon(Icons.update),
      ),
    );

}

/// Contenu permanent
class TitreDeSortiee extends StatelessWidget {
  const TitreDeSortiee({super.key});

  @override
  Widget build(BuildContext context)=>const Text('Resultat:',style: TextStyle(fontSize: 25));

}
