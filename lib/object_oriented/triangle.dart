import 'package:flutter/cupertino.dart';
import 'package:triangle_fractal/object_oriented/shape.dart';

class Triangle extends Shape {
  late Offset point1,point2,point3;

  Triangle(this.point1, this.point2, this.point3);
  Triangle.withTwoPoint(this.point1, this.point2);
}