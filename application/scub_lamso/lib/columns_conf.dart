import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

enum Field {
  entry,
  level,
  total,
}

final numberType = PlutoColumnType.number(
  defaultValue: 0,
  format: "###,###.###",
  allowFirstDot: true,
);

final columns = [
  PlutoColumn(
    title: 'A',
    field: Field.entry.name,
    formatter: (v) => "$v€",
    type: numberType,
  ),
  PlutoColumn(
    title: 'B',
    field: Field.level.name,
    formatter: (v) => "$v Lv",
    type: numberType,
  ),
  PlutoColumn(
      title: 'C',
      field: Field.total.name,
      type: numberType,
      formatter: (context) => "=$context",
      renderer: (context) => SizedBox.expand(
            child: ColoredBox(
              color: Colors.blue,
              child: Text("${context.cell.value}"),
            ),
          )),
];

final List<PlutoColumnGroup> columnGroups = [
  PlutoColumnGroup(title: 'Base', fields: [Field.entry.name, Field.level.name]),
  PlutoColumnGroup(title: 'Commons', fields: [Field.total.name]),
];
