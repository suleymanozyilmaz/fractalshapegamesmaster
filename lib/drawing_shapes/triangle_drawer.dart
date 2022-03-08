// Drawing Triangle Area
import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';
import '../shapes_style_constants.dart';

class TriangleDrawer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    rootTriangleRecursive(canvas, size.topCenter(const Offset(0.0, 0.0)),
        pi / 4, kTriangleEdgeLength);
  }

  // Drawing recursive triangle to canvas method
  void rootTriangleRecursive(
      Canvas canvas, Offset start, double angle, double _lineLength) {
    //Checking lineLength size if smaller then 10 px break method;
    if (_lineLength < 10) {
      return;
    }

    //continue to method if bigger then 10px;
    else {
      // Root Triangle right point
      var rightPoint = start.translate(cos(angle) * _lineLength,
          sin(angle) * _lineLength * kTrianglePointMultiplier);
      // Root Triangle left point
      var leftPoint = start.translate(cos(angle) * _lineLength * -1,
          sin(angle) * _lineLength * kTrianglePointMultiplier);


      // drawing start to right point edge of triangle
      canvas.drawLine(start, rightPoint, kGreenColorPaint);
      // drawing start to left point edge of triangle
      canvas.drawLine(start, leftPoint, kGreenColorPaint);
      // drawing right to left point edge of triangle
      canvas.drawLine(rightPoint, leftPoint, kGreenColorPaint);

      // sub right triangle start point
      var subRightTriangleStart = start.translate(
          (cos(angle) * _lineLength) / kTrianglePointMultiplier,
          (sin(angle) * _lineLength * kTrianglePointMultiplier) /
              kSubTriangleMidPointDivider);

      // sub left triangle start point
      var subLeftTriangleStart = start.translate(
          (cos(angle) * _lineLength * -1) / kSubTriangleMidPointDivider,
          (sin(angle) * _lineLength * kTrianglePointMultiplier) /
              kSubTriangleMidPointDivider);

      //sub top triangle
      rootTriangleRecursive(
          canvas, start, angle, _lineLength / kSubTriangleMidPointDivider);
      //sub left triangle
      rootTriangleRecursive(canvas, subLeftTriangleStart, angle,
          _lineLength / kSubTriangleMidPointDivider);
      //sub right triangle
      rootTriangleRecursive(canvas, subRightTriangleStart, angle,
          _lineLength / kSubTriangleMidPointDivider);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
