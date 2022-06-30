import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertest/model/Artithmetic.dart';

void main() {
  final arithmetic = Arithmetic();
  arithmetic.first = 1;
  arithmetic.second = 2;

  group("Arithmetic Test", () {
    test("add two numbers", () {
      int expectedValue = 3;
      int actualValue = arithmetic.add();
      expect(actualValue, expectedValue);
    });

    test("subtract two numbers", () {
      int expectedValue = -1;
      int actualValue = arithmetic.sub();
      expect(actualValue, expectedValue);
    });

    test("multiply two numbers", () {
      int expectedValue = 2;
      int actualValue = arithmetic.mul();
      expect(actualValue, expectedValue);
    });
  });
}
