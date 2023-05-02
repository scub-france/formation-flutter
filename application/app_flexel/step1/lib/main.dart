import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

/*

  PlutoGrid est un Widget riche qui permet de créer des tableaux
  configurables sur tous les aspects.

  La procédure la plus simple consiste à déclarer les colonnes
  et leurs options (Titre, type et fonctionnalités) puis les
  cellules et leurs valeurs et enfin instancier la grille.

 */

class PlutoGridDemo extends StatelessWidget {
  PlutoGridDemo({Key? key}) : super(key: key);

  // 1. Définition de nos colonnes
  static final columns = [
    PlutoColumn(
      width: 80,
      // Titre de la Colonne
      title: 'Saison',
      // Nom fonctionnel du champs
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
        // Un nombre
        type: PlutoColumnType.number(),
        // Ajout d'un footer qui calcul automatiquement la moyenne des points
        footerRenderer: (rendererContext) => PlutoAggregateColumnFooter(
            rendererContext: rendererContext,
            // D'autres options sont disponibles
            type: PlutoAggregateColumnType.average,
            format: '#,###',
            alignment: Alignment.center,
            titleSpanBuilder: (text) => [
                  const TextSpan(text: 'Moyenne', style: TextStyle(color: Colors.red)),
                  const TextSpan(text: ' : '),
                  TextSpan(text: text),
                ]))
  ];

  // 2. Déclaration de nos cellules et leurs valeurs.
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
            // Ajouter une option de coloration en fonction de la valeur de la cellule
            rowColorCallback: (rowColorContext) => rowColorContext.row.cells.entries.elementAt(2).value.value > 9
                ? Colors.blueAccent
                : Colors.transparent),
      );
}

void main() => runApp(
    MaterialApp(home: Scaffold(appBar: AppBar(title: const Center(child: Text('PlutoGrid'))), body: PlutoGridDemo())));
