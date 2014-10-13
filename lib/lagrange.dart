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
        totMul *= (x - points[j].x) / (points[i].x - points[j].x);
      }
      total += points[i].y * totMul;
    }
    return total;
  };
}