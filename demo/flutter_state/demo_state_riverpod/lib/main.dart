import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*

    === State: Riverpod ===

    Riverpod externalise la gestion des états hors 
    de Flutter.

 */

main() {
  // Déclarer le scope fonctionnel de Riverpod
  runApp(const ProviderScope(
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: AffichagePlanetes(),
        )),
  ));
}

/// Notre commission prend une décision
final commission =
    StreamProvider((ref) => Stream.periodic(const Duration(milliseconds: 800), (_) => Random().nextBool()));

/// La liste des planètes en fonction
final planetes = Provider<Planetes>((ref) =>
    ref.watch(commission).maybeWhen(data: (decision) => Planetes(etendu: decision), orElse: () => const Planetes()));

/// Notre widget d'affichage s'abonne à la commission
class AffichagePlanetes extends ConsumerWidget {
  const AffichagePlanetes({super.key});

  @override
  Widget build(context, ref) => ListView(children: [
        // Surveiller la décision de la Commission
        for (final planet in ref.watch(planetes).liste)
          ListTile(title: Text(planet, style: const TextStyle(fontSize: 22))),
      ]);
}

/// Modélisation de nos planètes.
class Planetes {
  static const _liste = [
    'Mercure',
    'Vénus',
    'Terre',
    'Mars',
    'Jupiter',
    'Saturne',
    'Uranus',
    'Neptune',
  ];

  List<String> get liste => etendu ? [..._liste, 'Pluton'] : _liste;

  final bool etendu;

  const Planetes({this.etendu = false});
}
