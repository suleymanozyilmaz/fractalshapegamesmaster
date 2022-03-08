import 'package:flutter/cupertino.dart';
import 'package:triangle_fractal/object_oriented/renderer.dart';
import 'package:triangle_fractal/object_oriented/shape.dart';

class ShapeContainer extends CustomPainter {
 // static final ShapeContainer _container = ShapeContainer._internal();
   List<Shape> shapes = <Shape>[];
   Renderer renderer = Renderer();


  void render(Canvas canvas, Size size){
    for (var shape in shapes) {
    renderer.draw(shape,canvas,size);
  }

}


  @override
  void paint(Canvas canvas, Size size) {
    render(canvas,size);
  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }



}