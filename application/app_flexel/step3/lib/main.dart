import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

/// Dans ce step, on verra comment ajouter dynamiquement des lignes,
/// formater le contenu des colonnes et la gestion des évènements.
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

  // A l'instar de la méthode setState() qui permet de changer l'état d'un
  // statefulWidget, une instance de PlutoGridStateManager permets de consulter
  // et changer l'état d'un plutoGridWidget.
  // Notre plutoGrid n'est pas encore initialisé, c'est pour cette raison qu'on
  // utilise late pour dire au framework que notre stateManager sera initialisé
  // plus tard...
  late final PlutoGridStateManager stateManager;

  @override
  void initState() {
    super.initState();
    compRow = 1;
  }

  @override
  Widget build(BuildContext context) {

    // définir les colonnes du tableau excel
    // Le constructeur du plutoGrid a besoin d'un paramètre column qui prend
    // une liste de PlutoColumn.
    List<PlutoColumn> columns = [
      PlutoColumn(
        title: 'Sprint',
        field: 'sprint',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
          title: 'Nbr_dev',
          field: 'nbrDev',
          type: PlutoColumnType.text(),
          formatter: (v) {
            if (double.tryParse(v) != null)
              return "$v devs";
            else
              return v;
          }),
      PlutoColumn(
          title: 'Nbr_jour',
          field: 'nbrJour',
          type: PlutoColumnType.text(),
          formatter: (v) {
            if (double.tryParse(v) != null)
              return "$v j";
            else
              return v;
          }),
      PlutoColumn(
          title: 'jours/homme',
          field: 'jourHomme',
          // Une autre manière de formatage consiste a modifier le comportement
          // du type en utilisant les paramètres de son constructeur. Cette
          // méthode peut s'avérer tres pratique quand on a plusieurs colonnes
          // qui partagent le meme comportement.
          // On commence par construire notre propre type:
          // final monNumberType= PlutoColumnType.number(.........);
          // Ensuite ,il suffit d'utiliser "monNumberType" dans le constructeur des colonne:
          // PlutoColumn(type: monNumberType, title:........)
          type:  PlutoColumnType.number(
            defaultValue: 0,
            format: "###,###.### j/h",
          ),
      )
    ];

    // On ajoute les lignes qui seront affichées au démarrage de l'applications.
    PlutoRow voidRow(int numberSprint) {
      return PlutoRow(
        cells: {
          'sprint': PlutoCell(value: "Sprint$numberSprint"),
          'nbrDev': PlutoCell(value: "0"),
          'nbrJour': PlutoCell(value: "0"),
          'jourHomme': PlutoCell(),
        },
      );
    }

    PlutoRow totalRow = PlutoRow(
      cells: {
        'sprint': PlutoCell(value: "*****"),
        'nbrDev': PlutoCell(value: "*****"),
        'nbrJour': PlutoCell(value: "TOTAL"),
        'jourHomme': PlutoCell(),
      },
    );

    // Le constructeur du plutoGrid a besoin d'un paramètre Row qui prend
    // une liste de PlutoRow.
    List<PlutoRow> rows = [voidRow(compRow), totalRow];

    // Le constructeur PlutoGrid, prends aussi en paramètres des méthodes pour
    // gérer les évènement
    PlutoGrid maGrille = PlutoGrid(
        columns: columns,
        rows: rows,
        // onLoaded nous permet de faire des actions quand le widget et chargé
        // Il nous permet ici d'initialiser notre stateManager
        onLoaded: (PlutoGridOnLoadedEvent event) {
          stateManager = event.stateManager;
          // On indique ici au stateManager d'empêcher l'utilisateur d'éditer
          // et donc de changer les colones sprint et jours/hommes
          stateManager.columns[0].enableEditingMode = false;
          stateManager.columns[3].enableEditingMode = false;
        },
        // onChanged est appelé quand la valeur de l'une des cellules du tableau
        // change.
        onChanged: (PlutoGridOnChangedEvent event) {

          // Grace a cette condition, seul les changement qui affectent les
          // cellules qui n'appartiennent pas a la dernière ligne (totalRow)
          // seront traités
          if (event.rowIdx != stateManager.rows.length - 1) {
            final nbrDev =
                stateManager.rows[event.rowIdx].cells['nbrDev']?.value;
            final nbrJour =
                stateManager.rows[event.rowIdx].cells['nbrJour']?.value;
            // formula.js fera les calcul pour nous.
            final totalRow = js.context
                .callMethod('eval', ['formulajs.PRODUCT([$nbrDev, $nbrJour])']);
            stateManager.rows[event.rowIdx].cells['jourHomme']?.value =
                "$totalRow";
            // totaux contiendra une liste des valeurs de la colonne jour_homme
            // sauf la dernière cellule.
            List totaux = [];
            for (int i = 0; i < stateManager.rows.length - 1; i++) {
              final jourHommeRow =
                  stateManager.rows[i].cells['jourHomme']?.value;
              totaux.add(jourHommeRow);
            }
            // On fourni la liste totaux a formula.js pour qu'il applique
            // la methode SUM().
            stateManager.rows[stateManager.rows.length - 1].cells['jourHomme']
                    ?.value =
                js.context.callMethod('eval', ['formulajs.SUM([$totaux])']);
          }

          // La valeur des cellules nbr_dev et nbr_jour de la dernière ligne,
          // peuvent changer on traite ici le cas si l'user change
          // leurs valeur, on remet ainsi les anciennes valeurs en cas de
          // changement.
          else {
            stateManager.rows[event.rowIdx].cells['nbrDev']?.value = '*****';
            stateManager.rows[event.rowIdx].cells['nbrJour']?.value = 'TOTAL';
          }
        });

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Permet d'ajouter une ligne a notre tableau
            stateManager.insertRows(compRow, [voidRow(compRow + 1)]);
            setState(() {
              compRow = compRow + 1;
            });
          },
          child: const Icon(Icons.add),
        ));
  }
}
