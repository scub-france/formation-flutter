import 'package:flutter/material.dart';

import 'desk.dart';
import 'main.dart';

final ScrollController ctrl = ScrollController()
  ..addListener(() => print("Quelque chose bouge!!"));

class Destinations extends StatelessWidget {
  const Destinations({Key? key}) : super(key: key);

  @override
  build(context) => Material(
    color: Colors.transparent,
    child: SizedBox(
      height: 80,
      child: ListView.builder(
        controller: ctrl,
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(),
        itemCount: Desk.values.length,
        itemBuilder: (context, idx) {
          final desk = Desk.values[idx];
          return DeskChoice(desk: desk);
        },
      ),
    ),
  );
}

class DeskChoice extends StatelessWidget {
  const DeskChoice({Key? key, required this.desk}) : super(key: key);

  final Desk desk;

  @override
  build(context) => GestureDetector(
    onTap: () {
      final cartography =
      context.findAncestorStateOfType<CartographyState>()!;
      cartography.center(coords: desk.coords);
    },
    child: Container(
        margin: const EdgeInsets.fromLTRB(8, 8, 0, 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(color: Colors.blue, width: .4)),
        height: 120,
        width: 280,
        child: Text(
          desk.label,
          style: Theme.of(context).textTheme.titleLarge,
        )),
  );
}
