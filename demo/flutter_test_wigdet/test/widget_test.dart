
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navdemo/main.dart';



void main() {
  testWidgets('Test navigation from HomeScreen to SecondScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Verify that the initial screen is the HomeScreen
    expect(find.text('Home'), findsOneWidget);

    // Tap the "Go to Second Screen" button
    await tester.tap(find.text('Go to Second Screen'));
    await tester.pumpAndSettle();

    // Verify that the SecondScreen is displayed
    expect(find.text('Second Screen'), findsOneWidget);

    // Tap the "Go to Third Screen" button
    await tester.tap(find.text('Go to Third Screen'));
    await tester.pumpAndSettle();

    // Verify that the ThirdScreen is displayed
    expect(find.text('Third Screen'), findsOneWidget);

    // Tap the "Go back to Home" button
    await tester.tap(find.text('Go back to Home'));
    await tester.pumpAndSettle();

    // Verify that the HomeScreen is displayed again
    expect(find.text('Home'), findsOneWidget);
  });
}

