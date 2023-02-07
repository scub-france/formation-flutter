import 'dart:async';
import 'dart:js' as js;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'columns_conf.dart';
import 'firebase_options.dart';

void main() async {
  //gridEventStream.stream.listen((ge) => print(ge));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: LamsoApp()));
}

// =============================

class Formula {
  final String content;
  final Field source;
  final Field destination;

  @override
  toString() => 'Formula{content: $content}';

  const Formula(this.content, this.source, this.destination);

  Future<Object> estimate(Object value) async {
    final jsFormula = content
        .replaceAll('\$', value.toString())
        .replaceAll('=', 'formulajs.');
    final jsEstimation = js.context.callMethod('eval', [jsFormula]);
    return jsEstimation;
  }
}

final plutoConfProvider = StateProvider((ref) => const PlutoGridConfiguration(
    enableMoveHorizontalInEditing: true,
    enterKeyAction: PlutoGridEnterKeyAction.toggleEditing));

final dataProvider = StateProvider((ref) => DataService(ref));

final formulaProvider = StateNotifierProvider<FormulaNotifier, String>(
    (ref) => FormulaNotifier(ref, "-"));

class FormulaNotifier extends StateNotifier<String> {
  final Ref ref;

  FormulaNotifier(this.ref, super.state);

  final formulas = {
    '1:3': const Formula("\$ * 2", Field.entry, Field.total),
    '0:2': const Formula("=COS(\$)", Field.level, Field.total),
  };

  void displayFormula(String f) {
    print("Select: $f");
    state = f;
  }

  void updateFormula(String newFormula) {
    final cell = ref.read(selectedCellProvider);
    formulas[cell] = Formula(newFormula, Field.level, Field.total);
    print("Update: ${formulas.toString()}");
  }
}

final selectedCellProvider =
    StateNotifierProvider<CellNotifier, String>((ref) => CellNotifier(":"));

class CellNotifier extends StateNotifier<String> {
  CellNotifier(super.state);

  select(int colIdx, int rowIdx) => state = "$colIdx:$rowIdx";
}

enum Collection { products, formulas }

class DataService {
  PlutoGridStateManager? _stateManager;

  final Ref ref;

  late FormulaNotifier formulasProvider;

  DataService(this.ref) {
    formulasProvider = ref.read(formulaProvider.notifier);
  }

  set stateManager(PlutoGridStateManager manager) {
    _stateManager = manager;
    load();
  }

  void load() async {
    /*

    final scrollController = PlutoGridScrollController();

    final stateManager = PlutoGridStateManager(
      columns: [],
      rows: [],
      gridFocusNode: FocusNode(),
      scroll: scrollController,
    );

    final gridManager = PlutoGridEventManager(stateManager: stateManager);

     */

    final products = await FirebaseFirestore.instance
        .collection(Collection.products.name)
        .get();

    print("products ${products.docs.length} loaded");

    final nrows = products.docs
        .map((e) => PlutoRow(
              key: ValueKey(e.id),
              cells: {
                Field.entry.name: PlutoCell(value: .8),
                Field.level.name: PlutoCell(value: 2),
                Field.total.name: PlutoCell(value: .0),
              },
            ))
        .toList();

    final candidats =
        await PlutoGridStateManager.initializeRowsAsync(columns, nrows);

    _stateManager!
      ..refRows.addAll(FilteredList(initialList: candidats))
      ..notifyListenersOnPostFrame()
      ..setOnSelected((event) {
        // TODO Beware the wolf
        final fieldName = event.cell!.column.field;
        final columnIdx =
            _stateManager!.refColumns.indexWhere((c) => c.field == fieldName);
        final rowIdx = "${event.rowIdx}";
        final formulaKey = "$columnIdx:$rowIdx";

        // Select Cell
        ref
            .read(selectedCellProvider.notifier)
            .select(columnIdx, event.rowIdx!);

        final currentFormula =
            formulasProvider.formulas[formulaKey]?.content ?? '-';

        ref.read(formulaProvider.notifier).displayFormula(currentFormula);
      })
      ..setOnChanged((PlutoGridOnChangedEvent pe) {
        //gridEventStream.add(GridEvent.rowAdded(pe.value));

        final eventCell = "${pe.columnIdx}:${pe.rowIdx}";

        if (formulasProvider.formulas.containsKey(eventCell)) {
          final formula = formulasProvider.formulas[eventCell]!;

          formula.estimate(pe.value).then((rs) {
            final destinationIdx = _stateManager!.refColumns
                .indexWhere((c) => c.field == formula.destination.name);

            final totalCell = _stateManager!.refRows[pe.rowIdx!].cells.values
                .toList()[destinationIdx];

            _stateManager!
              ..changeCellValue(totalCell, rs.toString())
              ..notifyListeners();
          });
        }

        //_estimate(pe.columnIdx!, pe.rowIdx!, pe.value);
        //_syncRemote(_getDocIdByEvent(pe), _getFieldName(pe), pe.value);
      });
  }

  void _syncRemote(String did, String field, Object value) {
    FirebaseFirestore.instance
        .collection(Collection.products.name)
        .doc(did)
        .update({field: value});
  }

  String _getFieldName(PlutoGridOnChangedEvent event) =>
      event.column!.field.toString();

  String _getDocIdByEvent(PlutoGridOnChangedEvent event) {
    String docId = event.row!.key.toString();
    docId = docId.substring(3, docId.length - 3);
    return docId;
  }

  void _estimate(int columnIdx, int rowIdx, double value) {
    if (columnIdx == 1) {
      final rs = value * 2.34;
      final totalIdx = _stateManager!.refColumns
          .indexWhere((c) => c.field == Field.total.name);
      final totalCell =
          _stateManager!.refRows[rowIdx].cells.values.toList()[totalIdx];
      _stateManager!
        ..changeCellValue(totalCell, rs.toString())
        ..notifyListeners();
    }
  }
}

class LamsoApp extends ConsumerWidget {
  const LamsoApp({super.key});

  @override
  build(context, ref) => MaterialApp(home: screenHome(ref, context));
}

Widget screenHome(WidgetRef ref, context) => Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          SizedBox(
            height: 100,
            child: FormulaDisplay(),
          ),
          SizedBox(
            height: 800,
            child: PlutoGrid(
                mode: PlutoGridMode.normal,
                configuration: ref.read(plutoConfProvider),
                columns: columns,
                columnGroups: columnGroups,
                rows: List.empty(growable: true),
                onLoaded: (event) =>
                    ref.read(dataProvider).stateManager = event.stateManager),
          ),
        ],
      ),
    ));

class FormulaDisplay extends ConsumerWidget {
  FormulaDisplay({super.key});

  final ctrl = TextEditingController();

  @override
  build(context, ref) => TextField(
        controller: ctrl..text = ref.watch(formulaProvider),
        onSubmitted: (content) =>
            ref.read(formulaProvider.notifier).updateFormula(content),
      );
}

/*

final gridEventStream = StreamController<GridEvent>.broadcast();

enum GridEventAction { rowAdded, rowRemoved }

class GridEvent {
  final GridEventAction action;
  final Object value;

  const GridEvent.rowAdded(Object o)
      : action = GridEventAction.rowAdded,
        value = o;
}

*/
