import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

/*

  PlutoGrid est un Widget complexe qui permet de créer des tableaux
  configurable sur tous les aspects.

 */

class PlutoGridDemo extends StatelessWidget {
  PlutoGridDemo({Key? key}) : super(key: key);

  // 1. Définition de nos colonnes
  static final columns = [
    PlutoColumn(
      width: 80,
      // Titre de la Colonne
      title: 'Saison',
      // Nom du champs
      field: 'season',
      // Type de cellule
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      width: 90,
      title: 'Equipe',
      field: 'team',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
        width: 90,
        title: 'Score',
        field: 'score',
        type: PlutoColumnType.number(),
        footerRenderer: (rendererContext) => PlutoAggregateColumnFooter(
            rendererContext: rendererContext,
            type: PlutoAggregateColumnType.sum,
            format: '#,###',
            alignment: Alignment.center,
            titleSpanBuilder: (text) => [
                  const TextSpan(text: 'Total', style: TextStyle(color: Colors.red)),
                  const TextSpan(text: ' : '),
                  TextSpan(text: text),
                ]))
  ];

  final rows = [
    PlutoRow(
      cells: {
        'season': PlutoCell(value: "22"),
        'team': PlutoCell(value: "White"),
        'score': PlutoCell(value: 8),
      },
    ),
    PlutoRow(
      cells: {
        'season': PlutoCell(value: "22"),
        'team': PlutoCell(value: "Blue"),
        'score': PlutoCell(value: 9),
      },
    ),
    PlutoRow(
      cells: {
        'season': PlutoCell(value: "23"),
        'team': PlutoCell(value: "White"),
        'score': PlutoCell(value: 10),
      },
    ),
    PlutoRow(
      cells: {
        'season': PlutoCell(value: "23"),
        'team': PlutoCell(value: "Blue"),
        'score': PlutoCell(value: 9),
      },
    ),
  ];

  @override
  build(context) => Container(
        padding: const EdgeInsets.all(15),
        child: PlutoGrid(
            columns: columns,
            rows: rows,
            rowColorCallback: (rowColorContext) => rowColorContext.row.cells.entries.elementAt(2).value.value > 9
                ? Colors.blueAccent
                : Colors.transparent),
      );
}

void main() => runApp(
    MaterialApp(home: Scaffold(appBar: AppBar(title: const Center(child: Text('PlutoGrid'))), body: PlutoGridDemo())));
