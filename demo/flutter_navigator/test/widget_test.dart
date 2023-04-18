import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('Test navigation from HomeScreen to SecondScreen',
          (WidgetTester tester) async {

        await tester.pumpWidget(MyApp());


        expect(find.text('Home'), findsOneWidget);


        await tester.tap(find.text('Go to Second Screen'));
        await tester.pumpAndSettle();


        expect(find.text('Second Screen'), findsOneWidget);


        await tester.tap(find.text('Go to Third Screen'));
        await tester.pumpAndSettle();


        expect(find.text('Third Screen'), findsOneWidget);


        await tester.tap(find.text('Go back to Home'));
        await tester.pumpAndSettle();


        expect(find.text('Home'), findsOneWidget);
      });
}

