import 'package:flutter/cupertino.dart';
import 'package:triangle_fractal/object_oriented/shape.dart';

class Line extends Shape {
  late Offset point, point2;

  Line(Offset point){
    points.add(const Offset(0, 0));
    points.add(point);
  }

  Line.twoPoint(this.point, this.point2);
}