import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertest/ArithmeticScreen.dart';
import 'package:fluttertest/ResultScreen.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Integration Test", (WidgetTester test) async {
    await test.pumpWidget(MaterialApp(
        routes: {"/result": (context) => const ResultScreen()},
        home: const ArithmeticScreen()));

    Finder num1 = find.byKey(const ValueKey("txtNum1"));
    await test.enterText(num1, "40");
    Finder num2 = find.byKey(const ValueKey("txtNum2"));
    await test.enterText(num2, "20");

    Finder btnSub = find.byKey(const ValueKey("btnSub"));
    await test.tap(btnSub);
    await test.pumpAndSettle();
    expect(find.text("Result: 20"), findsOneWidget);
  });
}
