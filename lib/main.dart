import 'dart:math';

import 'package:flutter/material.dart';

import 'package:triangle_fractal/object_oriented/circle.dart';
import 'package:triangle_fractal/object_oriented/line.dart';
import 'package:triangle_fractal/object_oriented/rectangle.dart';
import 'package:triangle_fractal/object_oriented/shape.dart';

import 'package:triangle_fractal/object_oriented/shape_container.dart';
import 'package:triangle_fractal/object_oriented/triangle.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FractalClass(),
    );
  }
}

class FractalClass extends StatefulWidget {

  const FractalClass({Key? key}) : super(key: key);

  @override
  State<FractalClass> createState() => _FractalClassState();
}

class _FractalClassState extends State<FractalClass> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);


    var shapeContainer = ShapeContainer();

    var center = Offset(MediaQuery.of(context).size.width/2, MediaQuery.of(context).size.height/2) ;

    shapeContainer.shapes.add(Line(const Offset(100,100)));
    shapeContainer.shapes.add(Line(const Offset(30,80)));
    Shape line = Line(const Offset(10,40));
    line.rotate(pi/4);
    shapeContainer.shapes.add(line);
    line.scale(5);


    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: CustomPaint(
            painter: shapeContainer,
            size: Size.infinite,
          ),
        )
      ),
    );
  }


}
