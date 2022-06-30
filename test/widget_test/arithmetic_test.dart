import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertest/ArithmeticScreen.dart';
import 'package:fluttertest/ResultScreen.dart';

void main() {
  group("Arithmetic Screen Test", () {
    testWidgets("Must Have Title", (WidgetTester test) async {
      await test.pumpWidget(
        const MaterialApp(
          title: "Arithmetic",
          home: ArithmeticScreen(),
        ),
      );
      Finder title = find.text("Arithmetic");
      expect(title, findsOneWidget);
    });
    testWidgets("Must Have Add", (WidgetTester test) async {
      await test.pumpWidget(
        const MaterialApp(
          title: "Arithmetic",
          home: ArithmeticScreen(),
        ),
      );
      Finder title = find.text("Add");
      expect(title, findsOneWidget);
    });
    testWidgets("Must Have Subtract", (WidgetTester test) async {
      await test.pumpWidget(
        const MaterialApp(
          title: "Arithmetic",
          home: ArithmeticScreen(),
        ),
      );
      Finder title = find.text("Subtract");
      expect(title, findsOneWidget);
    });
  });

  testWidgets("Add two numbers", (WidgetTester test) async {
    await test.pumpWidget(
      const MaterialApp(
        title: "Arithmetic",
        home: ArithmeticScreen(),
      ),
    );

    Finder num1 = find.byKey(const ValueKey("txtNum1"));
    await test.enterText(num1, "10");
    Finder num2 = find.byKey(const ValueKey("txtNum2"));
    await test.enterText(num2, "20");

    Finder btnAdd = find.byKey(const ValueKey("btnAdd"));
    await test.tap(btnAdd);
    await test.pump();
    expect(find.text("Result: 30"), findsOneWidget);
  });

  group("Integration Testing", () {
    testWidgets("Integration Testing For Add", (WidgetTester test) async {
      await test.pumpWidget(
        MaterialApp(
          routes: {"/result": (context) => const ResultScreen()},
          home: const ArithmeticScreen(),
        ),
      );

      Finder num1 = find.byKey(const ValueKey("txtNum1"));
      await test.enterText(num1, "10");
      Finder num2 = find.byKey(const ValueKey("txtNum2"));
      await test.enterText(num2, "20");

      Finder btnAdd = find.byKey(const ValueKey("btnAdd"));
      await test.tap(btnAdd);
      await test.pumpAndSettle();
      expect(find.text("Result: 30"), findsOneWidget);
    });
    testWidgets("Integration Testing For subtract", (WidgetTester test) async {
      await test.pumpWidget(
        MaterialApp(
          routes: {"/result": (context) => const ResultScreen()},
          home: const ArithmeticScreen(),
        ),
      );

      Finder num1 = find.byKey(const ValueKey("txtNum1"));
      await test.enterText(num1, "40");
      Finder num2 = find.byKey(const ValueKey("txtNum2"));
      await test.enterText(num2, "20");

      Finder btnSub = find.byKey(const ValueKey("btnSub"));
      await test.tap(btnSub);
      await test.pumpAndSettle();
      expect(find.text("Result: 20"), findsOneWidget);
    });
  });
}
