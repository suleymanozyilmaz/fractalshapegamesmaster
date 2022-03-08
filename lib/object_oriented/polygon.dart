import 'package:flutter/cupertino.dart';
import 'package:triangle_fractal/object_oriented/shape.dart';

class Polygon extends Shape {
  late List<Offset> polygonPoints;
  Polygon(this.polygonPoints);
}