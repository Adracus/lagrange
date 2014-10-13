library lagrange;

import 'dart:math';


typedef Func(num x);


Func lagrange(List<Point<num>> points) {
  return (num x) {
    double total = .0;
    for (int i = 0; i < points.length; i++) {
      double totMul = 1.0;
      for (int j = 0; j < points.length; j++) {
        if (i == j) continue;
        totMul *= (x - points[j].x) / (points[i].x - points[j].x);
      }
      total += points[i].y * totMul;
    }
    return total;
  };
}


Func lagrangeInt(List<Point<int>> points) {
  return (int x) {
    int total = 0;
    for (int i = 0; i < points.length; i++) {
      int totMul = 1;
      for (int j = 0; j < points.length; j++) {
        if (i == j) continue;
        totMul *= (x - points[j].x) ~/ (points[i].x - points[j].x);
      }
      total += points[i].y * totMul;
    }
    return total;
  };
}


Func modularLagrange(List<Point<int>> points, int prime) {
  return (int x) {
    int total = 0;
    for (int i = 0; i < points.length; i++) {
      int numerator = 1;
      int denominator = 1;
      for (int j = 0; j < points.length; j++) {
        if (i == j) continue;
        numerator = (numerator * (x - points[j].x)) % prime;
        denominator = (denominator * (points[i].x - points[j].x)) % prime;
      }
      int lagrangePolynomial = numerator * _modInverse(denominator, prime);
      total = (prime + total + points[i].y * lagrangePolynomial) % prime;
    }
    return total;
  };
}


int _modInverse(int k, int prime) {
  int v = k % prime;
  int r = _egcd(prime, v.abs())[2];
  return (prime + r) % prime;
}


List<int> _egcd(int a, int b) {
  if (a == 0) return [b, 0, 1];
  var res = _egcd(b % a, a);
  var g = res[0];
  var y = res[1];
  var x = res[2];
  return [g, x - (b / a).floor() * y, y];
}