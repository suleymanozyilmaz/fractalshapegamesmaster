import 'package:flutter/cupertino.dart';
import 'package:triangle_fractal/object_oriented/shape.dart';

class Rectangle extends Shape {
  late double height,width;
 // late Offset point1,point2,point3,point4;

//  Rectangle.withPoint(this.point1, this.point2, this.point3, this.point4);
  Rectangle(this.height, this.width);
}