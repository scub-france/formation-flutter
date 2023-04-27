import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

/// Dans ce step, on verra comment ajouter dynamiquement des lignes,
/// la gestion des évènements ainsi que l'intégration de Formula.js,
/// Il s'agit d'une librairie qui nous permets d'utiliser des fonctions excel.
/// Pour intégrer un module js dans flutter, il faut le faire dans index.html.
/// Je vous invite a le consulter (/web/index.html).
/// Il suffit ainsi d'ajouter ces deux lignes de codes entres les balises
/// <head></head> :
/// <script src="https://cdn.jsdelivr.net/npm/jstat@1.9.2/dist/jstat.min.js"></script>
/// <script src="https://cdn.jsdelivr.net/gh/formulajs/formulajs@2.9.3/dist/formula.min.js"></script>
/// Ensuite, noubliez pas de l'importer dans votre main : import 'dart:js' as js;
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
        // Le contenu de title sera affiché dans la vue
        title: 'Sprint',

        // Le contenu de field nous permets d'accéder a notre colonne.
        // On peut dire que c'est le nom LOGIQUE
        field: 'sprint',

        // On définie ici le type du contenu de nos cellules
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
          title: 'Nbr_dev',
          field: 'nbrDev',

          // Le contenu de Nbr_dev est logiquement un nombre, on aurait pu
          // le définir comme tel: PlutoColumnType.number().
          // On a opté pour type text pour les besoin de l'application,
          // On peut ainsi mettre des ***** dans la dernière ligne.
          type: PlutoColumnType.text()),
      PlutoColumn(
        title: 'Nbr_jour',
        field: 'nbrJour',

        // Le contenu de Nbr_dev est logiquement un nombre, on aurait pu
        // le définir comme tel: PlutoColumnType.number().
        // On a opté pour le type text pour les besoin de l'application,
        // On peut ainsi mettre des ***** dans la dernière ligne.
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'jours/homme',
        field: 'jourHomme',

        // Le contenu de Nbr_dev est logiquement un nombre, on aurait pu
        // le définir comme tel: PlutoColumnType.number().
        // On a opté pour type text pour les besoin de l'application,
        // On peut ainsi mettre des ***** dans la dernière ligne.
        type: PlutoColumnType.text(),
      ),
    ];

    // On ajoute les lignes qui seront affichées au démarrage de l'applications.
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

    // Le constructeur du plutoGrid a besoin d'un paramètre Row qui prend
    // une liste de PlutoRow.
    List<PlutoRow> rows = [voidRow(compRow), totalRow];

    // Le constructeur PlutoGrid, prends aussi en paramètres des méthodes pour
    // gérer les évènement
    PlutoGrid maGrille = PlutoGrid(
        columns: columns,
        rows: rows,
        // onLoaded nous permet de faire des actions quand le widget se charge
        // Il nous permet ici d'initialiser notre stateManager
        onLoaded: (PlutoGridOnLoadedEvent event) {
          stateManager = event.stateManager;
          // On indique ici au stateManager d'empêcher l'utilisateur d'éditer
          // et donc de changer les colones sprint et jours/hommes
          stateManager.columns[0].enableEditingMode= false;
          stateManager.columns[3].enableEditingMode= false;
        },
        // onChanged est appelé quand la valeur de l'une des cellules du tableau
        // change.
        onChanged: (PlutoGridOnChangedEvent event) {
          // Grace a cette condition, seul les changement qui affectent les
          // cellules qui n'appartiennent pas a la dernière ligne seront traités
          if (event.rowIdx != stateManager.rows.length - 1) {
            final nbrDev =
                stateManager.rows[event.rowIdx].cells['nbrDev']?.value;
            final nbrJour =
                stateManager.rows[event.rowIdx].cells['nbrJour']?.value;
            final totalRow = js.context
                .callMethod('eval', ['formulajs.PRODUCT([$nbrDev, $nbrJour])']);
            stateManager.rows[event.rowIdx].cells['jourHomme']?.value =
            "$totalRow";
            List totaux = [];
            for (int i = 0; i < stateManager.rows.length - 1; i++) {
              final jourHommeRow =
                  stateManager.rows[i].cells['jourHomme']?.value;
              totaux.add(jourHommeRow);
            }
            stateManager.rows[stateManager.rows.length - 1].cells['jourHomme']
                ?.value =
                js.context.callMethod('eval', ['formulajs.SUM([$totaux])']);
          }

          // La valeur des cellules nbr_dev et nbr_jour de la dernière ligne,
          // peuvent changer on traite ici le cas si l'user change
          // leurs valeur, on remet ainsi les anciennes valeurs en cas de
          // changement.
          else{
            stateManager.rows[event.rowIdx].cells['nbrDev']?.value='*****';
            stateManager.rows[event.rowIdx].cells['nbrJour']?.value='TOTAL';
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
            stateManager.insertRows(compRow, [voidRow(compRow+1)]);
            setState(() {
              compRow= compRow+1;
            });
          },
          child: const Icon(Icons.add),
        )
    );
  }
}
