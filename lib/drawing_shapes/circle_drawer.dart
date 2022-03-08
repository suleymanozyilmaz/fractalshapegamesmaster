
// Drawing Circle Area
import 'dart:math';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../shapes_style_constants.dart';

class CircleDrawer extends CustomPainter {

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
      start.translate(0, (sin(angle) * radius) / kSubCircleStartPointDivider);

      var subBottomCircleStart =
      start.translate(0, (sin(angle) * radius * -1) / kSubCircleStartPointDivider);

      var subLeftCircleStart =
      start.translate((cos(angle * 2) * radius) /kSubCircleStartPointDivider, 0);

      var subRightCircleStart =
      start.translate((cos(angle * 2) * radius * -1) / kSubCircleStartPointDivider, 0);

      rootCircleRecursive(canvas, subTopCircleStart, angle, radius / kSubCircleRadiusDivider);
      rootCircleRecursive(canvas, subBottomCircleStart, angle, radius / kSubCircleRadiusDivider);
      rootCircleRecursive(canvas, subLeftCircleStart, angle, radius / kSubCircleRadiusDivider);
      rootCircleRecursive(canvas, subRightCircleStart, angle, radius / kSubCircleRadiusDivider);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}