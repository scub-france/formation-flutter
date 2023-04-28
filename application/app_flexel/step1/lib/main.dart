
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

/// La librairie pluto_grid permet de dessiner et manipuler
/// un tableau excel.
/// C'est une librairie! pensez a la déclarer dans pubspec.yaml et
/// a son import (voir plus haut).
/// Dans ce step, on commence par la création d'un widget simple,
/// on verra la gestion des saisies et des évènements dans le step2.
void main() => runApp( MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const PlutoGridPage(),));

class PlutoGridPage extends StatefulWidget {
  const PlutoGridPage({super.key});

  @override
  State<PlutoGridPage> createState() => _PlutoGridPageState();
}

class _PlutoGridPageState extends State<PlutoGridPage> {
  late int compRow;
  final int totalJourHomme=0;

  @override
  void initState() {
    super.initState();
    compRow = 1;
  }

  @override
  Widget build(BuildContext context) {

    // définir les colonnes du tableau exel
    // Le constructeur du plutoGrid a besoin d'un paramètre column qui prend
    // une liste de PlutoColumn.
    List<PlutoColumn> columns = [
      PlutoColumn(
        width: 80,
        // Le contenu de title sera affiché dans la vue
        title: 'Sprint',

        // Le contenu de field nous permets d'accéder a notre colonne.
        // On peut dire que c'est le nom LOGIQUE
        field: 'sprint',

        // On définie ici le type du contenu de nos cellules
        type: PlutoColumnType.text(),
      ),

      PlutoColumn(
          width: 90,
          title: 'Nbr_dev',
          field: 'nbrDev',

          // Le contenu de Nbr_dev est logiquement un nombre, on aurait pu
          // le définir comme tel: PlutoColumnType.number().
          // On a opté pour type text pour les besoin de l'application,
          // On peut ainsi mettre des ***** dans la dernière ligne.
          type: PlutoColumnType.text()),

      PlutoColumn(
        width: 90,
        title: 'Nbr_jour',
        field: 'nbrJour',

        // Le contenu de Nbr_dev est logiquement un nombre, on aurait pu
        // le définir comme tel: PlutoColumnType.number().
        // On a opté pour le type text pour les besoin de l'application,
        // On peut ainsi mettre des ***** dans la dernière ligne.
        type: PlutoColumnType.text(),
      ),

      PlutoColumn(
        width: 130,
        title: 'Jours/Homme',
        field: 'jourHomme',

        // Le contenu de Nbr_dev est logiquement un nombre, on aurait pu
        // le définir comme tel: PlutoColumnType.number().
        // On a opté pour type text pour les besoin de l'application,
        // On peut ainsi mettre des ***** dans la dernière ligne.
        type: PlutoColumnType.text(),
      ),
    ];

    // On ajoute les lignes qui seront affichées au démarrage de l'applications.
    PlutoRow voidRow(int numberSprint) => PlutoRow(
          cells: {
            'sprint': PlutoCell(value: "Sprint$numberSprint"),
            'nbrDev': PlutoCell(value: "0"),
            'nbrJour': PlutoCell(value: "0"),
            'jourHomme': PlutoCell(value: "0"),
          },
        );
    PlutoRow totalRow = PlutoRow(
      cells: {
        'sprint': PlutoCell(value: ""),
        'nbrDev': PlutoCell(value: ""),
        'nbrJour': PlutoCell(value: "TOTAL"),
        'jourHomme': PlutoCell(value: 0),
      },
    );

    // Le constructeur du plutoGrid a besoin d'un paramètre Row qui prend
    // une liste de PlutoRow.
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
