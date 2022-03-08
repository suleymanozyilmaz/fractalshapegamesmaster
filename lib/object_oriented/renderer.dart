import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:triangle_fractal/object_oriented/circle.dart';
import 'package:triangle_fractal/object_oriented/line.dart';
import 'package:triangle_fractal/object_oriented/rectangle.dart';
import 'package:triangle_fractal/object_oriented/shape.dart';
import 'package:triangle_fractal/object_oriented/shape_container.dart';
import 'package:triangle_fractal/object_oriented/triangle.dart';
import 'package:triangle_fractal/shapes_style_constants.dart';

class Renderer {


//
  void draw(Shape shape, Canvas canvas, Size size) {
    print(shape);
    if (shape.isCircle){
      double radius = shape.getSize();
      Offset center = shape.getTransformedVertex(0);
      canvas.drawCircle(size.center(center), radius, kRedColorPaint);

    }else{
      List<Offset> points = shape.getTransformedVertice();
      if(points.length == 1){
        // nokta
      }
      else if (points.length == 2){
        //line
        canvas.drawLine(size.center(points[0]), size.center(points[1]), kRedColorPaint);
      }
      else{
        // close polygonme çiz
      }

    }
  }



  //Rectangle drawer list of point method
  List<Offset> drawWithPointRectangle(
      {required Offset leftTop,
      required rightTop,
      required rightBottom,
      required leftBottom,
      required double pointDistance}) {
    var rectanglePoints = <Offset>[];
    var topEdge = pointListGenerator(
        startPoint: leftTop, endPoint: rightTop, pointDistance: pointDistance);
    var rightEdge = pointListGenerator(
        startPoint: rightTop,
        endPoint: rightBottom,
        pointDistance: pointDistance);
    var bottomEdge = pointListGenerator(
        startPoint: rightBottom,
        endPoint: leftBottom,
        pointDistance: pointDistance);
    var leftEdge = pointListGenerator(
        startPoint: leftBottom,
        endPoint: leftTop,
        pointDistance: pointDistance);
    rectanglePoints.addAll(topEdge);
    rectanglePoints.addAll(rightEdge);
    rectanglePoints.addAll(bottomEdge);
    rectanglePoints.addAll(leftEdge);
    return rectanglePoints;
  }

  // List of point creating method
  List<Offset> pointListGenerator(
      {required Offset startPoint,
      required Offset endPoint,
      required double pointDistance}) {
    var pointList = <Offset>[];

    double distance = (startPoint - endPoint).distance;
    var minPointCount = 4;
    pointDistance = min(pointDistance, distance / minPointCount);
    pointDistance = distance / (distance / pointDistance).floorToDouble();

    double increasingSize = pointDistance / distance;

    for (double alpha = 0; alpha <= 1; alpha = alpha + increasingSize) {
      var px = (1 - alpha) * startPoint.dx + alpha * endPoint.dx;
      var py = (1 - alpha) * startPoint.dy + alpha * endPoint.dy;

      Offset newPoint = Offset(px, py);
      pointList.add(newPoint);
    }
    return pointList;
  }

  List<Offset> circlePointListGenerator(
      {required double radius,
      required Offset center,
      required double pointDistance}) {
    var pointList = <Offset>[];

    double distance = 2 * pi * radius;
    double increasingSize = pointDistance / distance;
    double px = 0.0;
    double py = 0.0;

    for (double alpha = 0; alpha <= 360; alpha = alpha + increasingSize) {
      px = px + radius * cos(alpha);
      py = py + radius * sin(alpha);
      Offset newPoint = Offset(px, py);
      pointList.add(newPoint);
    }
    return pointList;
  }

  List<Offset> trianglePointListGenerator({
    required Offset firstPoint,
    required Offset secondPoint,
    required Offset thirdPoint,
  }) {
    var pointList = pointListGenerator(
        startPoint: firstPoint, endPoint: secondPoint, pointDistance: 20);

    pointList = pointList +
        pointListGenerator(
            startPoint: secondPoint, endPoint: thirdPoint, pointDistance: 20);
    pointList = pointList +
        pointListGenerator(
            startPoint: thirdPoint, endPoint: firstPoint, pointDistance: 20);
    return pointList;
  }
}
