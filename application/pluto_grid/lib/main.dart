import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'dart:js' as js;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int compSprint;
  late int compRow;
  late int totalJourHomme;
  late int sprint;
  late PlutoGridStateManager stateManager;

  @override
  void initState() {
    compSprint = 1;
    compRow = 1;
    totalJourHomme=0;
    sprint=0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<PlutoColumn> columns = [
      /// Text Column definition
      PlutoColumn(
        title: 'Sprint',
        field: 'sprint',
        type: PlutoColumnType.text(),
      ),

      /// Number Column definition
      PlutoColumn(
        title: 'Nbr_dev',
        field: 'nbrDev',
        type: PlutoColumnType.text(),
      ),

      /// Select Column definition
      PlutoColumn(
        title: 'Nbr_jour',
        field: 'nbrJour',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'jours/homme',
        field: 'jourHomme',
        type: PlutoColumnType.number(),
      ),
    ];

    PlutoRow voidRow (int numberSprint)=> PlutoRow(
      cells: {
        'sprint': PlutoCell(value: "Sprint${numberSprint}"),
        'nbrDev': PlutoCell(value: "0"),
        'nbrJour': PlutoCell(value: "0"),
        'jourHomme': PlutoCell(value: "0"),
      },
    );
    PlutoRow totalRow=PlutoRow(
      cells: {
        'sprint': PlutoCell(value: "*****"),
        'nbrDev': PlutoCell(value:"*****"),
        'nbrJour': PlutoCell(value: "*****"),
        'jourHomme': PlutoCell(value: 0),
      },
    );
    List<PlutoRow> rows = [voidRow(sprint),totalRow];
    PlutoGrid maGrille = PlutoGrid(
        columns: columns,
        rows: rows,
        onChanged: (PlutoGridOnChangedEvent event) {
          if (event.columnIdx == 1 || event.columnIdx == 2) {
            final nbrDev = stateManager.rows[event.rowIdx].cells['nbrDev']
                ?.value;
            final nbrJour = stateManager.rows[event.rowIdx].cells['nbrJour']
                ?.value;
            final totalRow = js.context.callMethod(
                'eval', ['formulajs.PRODUCT([$nbrDev, $nbrJour])']);
            stateManager.rows[event.rowIdx].cells['jourHomme']?.value =
            "$totalRow";
            List totaux=[];
            for (int i = 0; i < stateManager.rows.length - 1; i++) {
              final jourHommeRow = stateManager.rows[i].cells['jourHomme']
                  ?.value;
              totaux.add(jourHommeRow);
            }
            stateManager.rows[stateManager.rows.length - 1].cells['jourHomme']
                ?.value =
                js.context.callMethod('eval',
                    ['formulajs.SUM([$totaux])']);
          }
        }
        ,
        onLoaded: (PlutoGridOnLoadedEvent event) {
          stateManager = event.stateManager;
        });
    return Scaffold(
      appBar: AppBar(
        title: const Text('PlutoGrid Demo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: maGrille,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          stateManager.insertRows(compRow, [voidRow(sprint+1)]);
          setState(() {
            compRow++;
            sprint++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}