import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

/// Dans ce step on va voir l'intégration et un exemple d'utilisation de Formula.js,
/// Il s'agit d'une librairie qui nous permets d'utiliser des fonctions excel.
/// Pour intégrer un module js dans flutter, il faut le faire dans index.html.
/// Je vous invite a le consulter (/web/index.html).
/// Il suffit ainsi d'ajouter ces deux lignes de codes entres les balises
/// <head></head> :
/// <script src="https://cdn.jsdelivr.net/npm/jstat@1.9.2/dist/jstat.min.js"></script>
/// <script src="https://cdn.jsdelivr.net/gh/formulajs/formulajs@2.9.3/dist/formula.min.js"></script>
/// Ensuite, n'oubliez pas de l'importer dans votre main : import 'dart:js' as js;
/// Vous trouverez un appel de formulas.js dans la méthode initState(),
/// le résultat du calcul sera affiché dans la console.
void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const MyHomePage(title: 'Flutter Demo Home Page'),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int compRow;
  final int totalJourHomme = 0;

  @override
  void initState() {
    super.initState();
    const param1 = 10;
    const param2 = 5;
    // Appel de la methode  SUM(), notez qu'on doit mettre les paramètres
    // dans une liste.
    // Vous trouverez sur ce lien la liste des méthodes existantes:
    // https://formulajs.info/functions/
    final result= js.context.callMethod('eval',['formulajs.SUM([$param1, $param2])']);
    print('Resultat de la methode SUM(): $result');
    compRow = 1;
  }

  @override
  Widget build(BuildContext context) {
    List<PlutoColumn> columns = [
      PlutoColumn(
        title: 'Sprint',
        field: 'sprint',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
          title: 'Nbr_dev',
          field: 'nbrDev',
          type: PlutoColumnType.text()),
      PlutoColumn(
        title: 'Nbr_jour',
        field: 'nbrJour',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'jours/homme',
        field: 'jourHomme',
        type: PlutoColumnType.text(),
      ),
    ];

    PlutoRow voidRow(int numberSprint) {
      return PlutoRow(
        cells: {
          'sprint': PlutoCell(value: "Sprint$numberSprint"),
          'nbrDev': PlutoCell(value: "0"),
          'nbrJour': PlutoCell(value: "0"),
          'jourHomme': PlutoCell(value: "0"),
        },
      );
    }
    PlutoRow totalRow = PlutoRow(
      cells: {
        'sprint': PlutoCell(value: "*****"),
        'nbrDev': PlutoCell(value: "*****"),
        'nbrJour': PlutoCell(value: "TOTAL"),
        'jourHomme': PlutoCell(value: 0),
      },
    );

    List<PlutoRow> rows = [voidRow(compRow), totalRow];

    PlutoGrid maGrille = PlutoGrid(
      columns: columns,
      rows: rows,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
              'Flexel',
              style: TextStyle(fontSize: 40),
            )),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: maGrille,
      ),
    );
  }
}
