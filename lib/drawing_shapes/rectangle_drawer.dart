
import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../constants.dart';
import '../shapes_style_constants.dart';

class RectangleDrawer extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    rootRectRecursive(
        canvas, size.topLeft(const Offset(0.0, 0.0)), pi / 4, size.width);
  }


  void rootRectRecursive(
      Canvas canvas, Offset start, double angle, double edgeSize) {
    //Checking radius size if smaller then 5 px break method;
    if (edgeSize < 5) {
      return;
    }

    //continue to method if bigger then 5px;
    else {
      //Brush definition(Color, width etc.)
      var paint = Paint()
        ..color = Color(Random().nextInt(0xffffffff))
        ..strokeWidth = 2;

      // drawing root rectangle
      canvas.drawRect(start & Size(edgeSize,edgeSize), paint);

      // sub rectangle start point
      var subRectPoint = start.translate(
          cos(angle) , sin(angle) );

      // drawing sub rectangle
      rootRectRecursive(canvas, subRectPoint, angle, edgeSize * kSubRectEdgeSizeDivider);

    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}