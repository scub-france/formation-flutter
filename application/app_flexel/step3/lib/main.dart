import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

/*

  Flexel simule un gestionnaire de projets.
  Des responsables en charge d'une partie d'un projet
  indique le nombre de jours requis.

  Nous nous appuyons sur PlutoGrid et JS pour afficher
  la grille de calcul.

 */

class FlexelApp extends StatefulWidget {
  const FlexelApp({Key? key}) : super(key: key);

  @override
  State<FlexelApp> createState() => _FlexelAppState();
}

class _FlexelAppState extends State<FlexelApp> {
  // Gestionnaire d'état de notre instance PlutoGrid
  late final PlutoGridStateManager stateManager;

  // Résultat de notre tableau
  double total = .0;

  // 1. Définition de nos colonnes
  static final columns = [
    PlutoColumn(
      width: 80,
      // Titre de la Colonne
      title: 'Responsable',
      // Nom fonctionnel du champs
      field: 'people',
      // Type de cellule
      type: PlutoColumnType.text(),
      // non-éditable
      enableEditingMode: false,
    ),
    PlutoColumn(
      width: 90,
      title: 'Section',
      field: 'section',
      type: PlutoColumnType.text(),
      // non-éditable
      enableEditingMode: false,
    ),
    PlutoColumn(
        width: 50,
        title: 'Jours',
        field: 'jours',
        // Un nombre
        type: PlutoColumnType.number(defaultValue: 0)),
    PlutoColumn(
      width: 110,
      title: 'Taux',
      field: 'tjm',
      type: PlutoColumnType.currency(defaultValue: .0, locale: 'fr'),
      // non-éditable
      enableEditingMode: true,
    ),
    PlutoColumn(
      width: 110,
      title: 'Frais',
      field: 'fees',
      type: PlutoColumnType.currency(defaultValue: .0, locale: 'fr'),
      // non-éditable car calculé
      enableEditingMode: false,
    ),
  ];

  // 2. Déclaration de nos cellules et leurs valeurs.
  final rows = [
    PlutoRow(
      cells: {
        'people': PlutoCell(value: "Dayan"),
        'section': PlutoCell(value: "Conception"),
        'jours': PlutoCell(),
        'tjm': PlutoCell(value: 600),
        'fees': PlutoCell(),
      },
    ),
    PlutoRow(
      cells: {
        'people': PlutoCell(value: "Nicolas"),
        'section': PlutoCell(value: "UX"),
        'jours': PlutoCell(),
        'tjm': PlutoCell(value: 520),
        'fees': PlutoCell(),
      },
    ),
    PlutoRow(
      cells: {
        'people': PlutoCell(value: "Hicham"),
        'section': PlutoCell(value: "Design"),
        'jours': PlutoCell(),
        'tjm': PlutoCell(value: 560),
        'fees': PlutoCell(),
      },
    ),
    PlutoRow(
      cells: {
        'people': PlutoCell(value: "Florient"),
        'section': PlutoCell(value: "DevOps"),
        'jours': PlutoCell(),
        'tjm': PlutoCell(value: 700),
        'fees': PlutoCell(),
      },
    ),
  ];

  @override
  build(context) => Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              flex: 2,
              child: PlutoGrid(
                  columns: columns,
                  rows: rows,
                  // Premier chargement du widget
                  // Nous interception le gestionnaire d'état pour commander
                  // les futures MAJ de la grille
                  onLoaded: (load) => stateManager = load.stateManager,
                  // Une mise à jour de cellule a eu lieu
                  onChanged: (change) {
                    // Récupérer la ligne active après une sélection de cellule
                    final row = change.rowIdx;

                    // Les valeurs jours et tjm sur cette ligne sont extraites
                    final jours = stateManager.refRows[row].cells['jours']?.value;
                    final tjm = stateManager.refRows[row].cells['tjm']?.value;

                    // Appel de la librairie FormulaJS pour effectuer le calcul de formule
                    final formula = 'formulajs.PRODUCT([$jours, $tjm])';
                    print("Estimation de la formule: [$formula]");
                    final totalRow = js.context.callMethod('eval', [formula]);

                    // La colonne de frais est mise à jour avec la valeur renvoyée par JS
                    stateManager.refRows[row].cells['fees']?.value = "$totalRow";

                    try {
                      // Mettre à jour notre total sur le projet
                      setState(() {
                        // Addition l'ensemble de la colonne fees
                        // On récupère la valeur de chaque cellule de la colonne fees
                        // dans une liste qui `Fold()` par addition
                        total = stateManager.refRows.originalList.map<double>((row) {
                          final content = row.cells['fees']?.value;
                          return content is double ? content : double.parse(content);
                        }).fold(.0, (p, e) => p + e);
                      });
                    } catch (e, s) {
                      print('Exception $e');
                    }
                  })),
          Flexible(
            child: Text(
              "Total: $total €",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          )
        ],
      ));
}

void main() => runApp(MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Center(child: Text('Gestion de Projet'))),
      body: Column(
        children: const [
          Explications(),
          Expanded(child: FlexelApp()),
        ],
      ),
    )));

/// Message sur le fonctionnement
class Explications extends StatelessWidget {
  const Explications({super.key});

  @override
  build(context) => Card(
      child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 90),
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Text("Vous pouvez modifier les valeurs des colonnes jours et taux "
                "pour mettre à jour les calculs."),
          )));
}
