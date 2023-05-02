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
      footerRenderer: (rendererContext) => PlutoAggregateColumnFooter(
          rendererContext: rendererContext,
          type: PlutoAggregateColumnType.sum,
          format: '####€',
          filter: (cell) {
            print(cell.value.runtimeType);
            return true;
          },
          formatAsCurrency: true,
          alignment: Alignment.center,
          titleSpanBuilder: (data) => [
                const TextSpan(text: 'Total', style: TextStyle(color: Colors.blueGrey)),
                const TextSpan(text: ': '),
                TextSpan(text: data),
              ]),
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
      child: PlutoGrid(
          columns: columns,
          rows: rows,
          // Premier chargement du widget
          // Nous interception le gestionnaire d'état pour commander
          // les futures MAJ de la grille
          onLoaded: (load) => stateManager = load.stateManager,
          // Une mise à jour de cellule a eu lieu
          onChanged: (change) {
            final row = change.rowIdx;

            final jours = stateManager.refRows[row].cells['jours']?.value;
            final tjm = stateManager.refRows[row].cells['tjm']?.value;

            // Appel de la librairie FormulaJS pour effectuer le calcul de formule
            final totalRow = js.context.callMethod('eval', ['formulajs.PRODUCT([$jours, $tjm])']);
            stateManager.refRows[row].cells['fees']?.value = "$totalRow";
            stateManager.notifyListeners();
          }));
}

void main() => runApp(MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Center(child: Text('Gestion de Projet'))),
      body: Column(
        children: [
          Card(
              child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 90,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("Vous pouvez modifier les valeurs des colonnes jours et taux "
                        "pour mettre à jour les calculs."),
                  ))),
          const Expanded(child: FlexelApp()),
        ],
      ),
    )));
