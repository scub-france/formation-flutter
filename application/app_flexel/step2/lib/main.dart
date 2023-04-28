import 'dart:js' as js;

import 'package:flutter/material.dart';

/// Dans ce step on va voir l'intégration et un exemple d'utilisation de Formula.js,
/// Il s'agit d'une librairie qui nous permets d'utiliser des fonctions excel.
/// Pour intégrer un module js dans flutter, il faut le faire dans index.html.
/// Je vous invite a le consulter (/web/index.html).
/// Il suffit ainsi d'ajouter ces deux lignes de codes entres les balises
/// <head></head> :
/// <script src="https://cdn.jsdelivr.net/npm/jstat@1.9.2/dist/jstat.min.js"></script>
/// <script src="https://cdn.jsdelivr.net/gh/formulajs/formulajs@2.9.3/dist/formula.min.js"></script>
/// Ensuite, n'oubliez pas de l'importer dans votre main : import 'dart:js' as js;

void main() =>
    runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FormulajsPage(),
    ));

class FormulajsPage extends StatelessWidget {
  const FormulajsPage({super.key});

  final param1 = 10;
  final param2 = 5;

  @override
  Widget build(BuildContext context) {
    // Appel de la methode  SUM(), notez qu'on doit mettre les paramètres
    // dans une liste.
    // Vous trouverez sur ce lien la liste des méthodes existantes:
    // https://formulajs.info/functions/
    final resultSum = js.context.callMethod(
        'eval', ['formulajs.SUM([$param1, $param2])']);

    // Appel de la methode Product()...
    final resultProduct = js.context.callMethod(
        'eval', ['formulajs.PRODUCT([$param1, $param2])']);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
              'Formula.js',
              style: TextStyle(fontSize: 40),
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DecoratedBox(
                decoration: const BoxDecoration(color: Colors.lightBlueAccent,),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Resultat de Sum() : $resultSum",
                      style: const TextStyle(fontSize: 40)),
                )),
            DecoratedBox(
              decoration: const BoxDecoration(color: Colors.lightBlueAccent,),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Resultat de Product() : $resultProduct",
                    style: const TextStyle(fontSize: 40)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
