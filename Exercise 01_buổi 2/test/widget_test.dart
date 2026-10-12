import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:exercise_01_buoi_2/main.dart';

void main() {
  testWidgets('calculator adds two numbers', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), '4');
    await tester.enterText(find.byType(TextField).at(1), '4');
    await tester.tap(find.text('+'));
    await tester.pump();

    expect(find.text('Kết quả: 8'), findsOneWidget);
  });

  testWidgets('calculator reports division by zero', (WidgetTester tester) async {
    await tester.pumpWidget(const CalculatorApp());

    await tester.enterText(find.byType(TextField).at(0), '4');
    await tester.enterText(find.byType(TextField).at(1), '0');
    await tester.tap(find.text('/'));
    await tester.pump();

    expect(find.text('Không thể chia cho 0.'), findsOneWidget);
  });
}
