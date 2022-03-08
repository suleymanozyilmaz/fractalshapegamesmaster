
import 'package:flutter/cupertino.dart';
import 'package:triangle_fractal/object_oriented/shape.dart';

class Circle extends Shape {


  Circle(double radius){
    isCircle = true;
    points.add(const Offset(0,0));
    points.add( Offset(radius, 0));
  }

  Circle.withCenter(Offset center, double radius){
    isCircle = true;
    points.add(center);
    points.add( Offset(center.dx + radius, center.dy ));
  }

  Offset getCenter(){
    return points[0];
  }


  double getRadius(){
    List<Offset> transformed = getTransformedVertice();
    return (transformed[0]- transformed[1]).distance;
  }


  @override
  double getSize() {
    return getRadius();
  }
}