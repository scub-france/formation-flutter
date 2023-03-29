import 'package:flutter/material.dart';

void main() => runApp(const Layout());

class Layout extends StatelessWidget {
  static const star = Icon(Icons.desktop_mac, size: 20, color: Colors.orange);

  static const size = 120.0;

  const Layout({super.key});

  @override
  build(_) => MaterialApp(
      title: 'Layout et mise en page',
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              title: Text('Alignement'),
              subtitle: Text('Début, Centré, Fin'),
            ),
            repartition([MainAxisAlignment.start, MainAxisAlignment.center, MainAxisAlignment.end]),
            const ListTile(
              title: Text('Répartition'),
              subtitle: Text('Entre, Autour, Egalité'),
            ),
            repartition([MainAxisAlignment.spaceBetween, MainAxisAlignment.spaceAround, MainAxisAlignment.spaceEvenly]),
          ],
        ),
      ));

  /// Pour chaque [Alignment] on applique un mode Colonne et Ligne
  Widget repartition(Iterable<MainAxisAlignment> aligns) => Row(
        children: [
          buildColumnAlignment(aligns),
          buildRowAlignment(aligns),
        ],
      );

  /// Construire et Aligner dans une [Column]
  Widget buildColumnAlignment(Iterable<MainAxisAlignment> aligns) => SizedBox(
      width: size,
      height: size,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: aligns
              .map((align) => Column(
                    mainAxisAlignment: align,
                    children: const [star, star, star],
                  ))
              .toList(),
        ),
      ));

  /// Construire et Aligner dans une [Row]
  Widget buildRowAlignment(Iterable<MainAxisAlignment> aligns) => SizedBox(
      width: size,
      height: size,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: aligns
              .map((align) => Row(
                    mainAxisAlignment: align,
                    children: const [star, star, star],
                  ))
              .toList(),
        ),
      ));
}
