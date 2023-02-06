import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const ProviderScope(child: DesignApp()));

const url =
    'https://marvelous-crisp-dc8bf2.netlify.app/.netlify/functions/pricing';

final pricePvd = FutureProvider<double>((ref) async {
  final rs = await http.get(Uri.parse(url));
  Map<String, dynamic> map = jsonDecode(rs.body);
  return map['price'];
  //return Future.delayed(const Duration(milliseconds: 1200), () => amount);
});

class DesignApp extends ConsumerWidget {
  const DesignApp({Key? key}) : super(key: key);

  @override
  build(context, ref) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Obtention du prix',
        theme: ThemeData.light().copyWith(useMaterial3: true),
        home: const Scaffold(body: Center(child: Pricing())),
      );
}

/// Calculated Price
class Pricing extends ConsumerWidget {
  const Pricing({Key? key}) : super(key: key);

  @override
  build(context, ref) => ref.watch(pricePvd).map<Widget>(
      data: (amount) => Text(amount.value.toStringAsFixed(2)),
      error: (e) => const Icon(Icons.warning),
      loading: (e) => const SizedBox(
            height: 3,
            width: 150,
            child: LinearProgressIndicator(),
          ));
}
