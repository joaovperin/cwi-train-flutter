// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cleandex_poketecture/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/di_init.dart';

void main() {
  registerDependencies();
  testWidgets('App should render initial page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    final startButtonFinder = find.widgetWithText(ElevatedButton, 'Start');

    // Start button is disabled
    expect(startButtonFinder, findsOneWidget);
    expect(tester.widget<ElevatedButton>(startButtonFinder).enabled, isFalse);

    await tester.pumpAndSettle(const Duration(milliseconds: 3000));

    // Verify that our app has rendered.
    expect(find.text('Cleandex'), findsOneWidget);
    expect(find.text('Pokétecture'), findsOneWidget);

    // After some seconds, start button should be enabled
    expect(tester.widget<ElevatedButton>(startButtonFinder).enabled, isTrue);

    // Verify that is has credits
    expect(find.text('Created by João Victor A. Perin'), findsOneWidget);
  });
}
