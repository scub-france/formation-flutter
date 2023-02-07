import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

// Implémenter et tester un compteur

final compteur = StateProvider((ref) => 0);

// Affichage du compteur et mise à jour
class CompteurApp extends StatelessWidget {
  @override
  build(_) => MaterialApp(
        home: Consumer(builder: (context, ref, _) {
          // Surveiller notre compteur et capter sa valeur
          final counter = ref.watch(compteur);
          return ElevatedButton(
            onPressed: () => ref.read(compteur.notifier).state++,
            child: Text('$counter'),
          );
        }),
      );
}

void main() {
  testWidgets('MAJ affichage et incrément', (tester) async {
    await tester.pumpWidget(ProviderScope(child: CompteurApp()));

    // La valeur du compteur est 0 à la création
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Incrément et MAJ de l'interface
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Vérifier l'affichage
    expect(find.text('1'), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });
}
