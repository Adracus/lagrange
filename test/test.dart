import 'package:lagrange/lagrange.dart';
import 'package:unittest/unittest.dart';
import 'dart:math';

main() {
  var points = [new Point(1.0, 1.0), new Point(2.0, 2.0),
                new Point(-1.0, 1.0), new Point(-2.0, 2.0)];
  var f = lagrange(points);
  
  test("Interpolated function should have all origin values", () {
    expect(f(1), equals(1.0));
    expect(f(2), equals(2.0));
    expect(f(-1), equals(1.0));
    expect(f(-2), equals(2.0));
  });
}