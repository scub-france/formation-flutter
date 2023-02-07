import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'task/display/board.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(useMaterial3: true).copyWith(
      backgroundColor: const Color(0xff031d36),
      scaffoldBackgroundColor: const Color(0xff031d36),
    ),
    home: const Scaffold(body: ProviderScope(child: Board()))));
