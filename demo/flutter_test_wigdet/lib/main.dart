


//Voici un exemple de test de widget simple
// qui teste qu'un widget de texte affiche le texte correctement

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Text widget displays correct text', (WidgetTester tester) async {

  }


    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Text('Hello, world!'),
        ),
      ),
    );
