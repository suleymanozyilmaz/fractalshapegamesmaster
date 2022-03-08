
// Drawing Circle Area
import 'dart:math';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../shapes_style_constants.dart';

class CircleDrawerOneSub extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    rootCircleRecursive(
        canvas, size.center(const Offset(0.0, 0.0)), -pi / 2, kRootCircleRadius);
  }

  void rootCircleRecursive(
      Canvas canvas, Offset start, double angle, double radius) {
    //Checking radius size if smaller then 10 px break method;
    if (radius < 10) {
      return;
    }

    //continue to method if bigger then 10px;
    else {
      //Brush definition(Color, width etc.)
      var paint = Paint()
        ..color = Color(Random().nextInt(0xffffffff))
        ..strokeWidth = 2;

      // drawing root circle
      canvas.drawCircle(start, radius, paint);

      // sub Top Circle drawing with new start point
      var subTopCircleStart =
      start.translate(0, (sin(angle) * radius * kSubCircleStartPoint) / 2);


      rootCircleRecursive(canvas, subTopCircleStart, angle, radius * kSubCircleRadiusDivider2 );

    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}