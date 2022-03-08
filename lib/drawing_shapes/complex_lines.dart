

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComplexLines extends CustomPainter{


  @override
  void paint(Canvas canvas, Size size) {

    // we are calling method with center of screen and 100px length line
    rootComplexLine(canvas, size.center(const Offset(0.0, 0.0)),
        pi , 100);
  }
    void rootComplexLine(
        Canvas canvas, Offset start, double angle, double _lineLength) {
      const subLineDivider = 2;
      const angleDivider = 2;
      //Checking lineLength size if smaller then 5 px break method;
      if (_lineLength < 10) {
        return;
      }

      // we are painting our line
      var paint = Paint()
      //   ..color = Colors.green
       ..color = Color(Random().nextInt(0xffffffff))
        ..strokeWidth = 2;

      //main line, we were start center then we go to right and left point
      var rootLineRightPoint = start.translate(cos(angle) * - _lineLength, 0);
      var rootLineLeftPoint = start.translate(cos(angle) *  _lineLength, 0);


      // in main line; start point to right point drawing
      canvas.drawLine(start, rootLineRightPoint, paint);

      // in main line; start point to left point drawing
      canvas.drawLine(start, rootLineLeftPoint, paint);

      //in main line; right point to new up point determining
      var rootRightPointUpPoint = rootLineRightPoint.translate(0, sin(angle /angleDivider) * - _lineLength);

      //in main line; right point to new down point determining
      var rootRightPointDownPoint = rootLineRightPoint.translate(0, sin(angle / angleDivider) *  _lineLength);

      // in the root line; right up point to right down point drawing
      canvas.drawLine(rootRightPointDownPoint, rootRightPointUpPoint, paint);

      //in main line; left point to new up point determining
      var rootLeftPointUpPoint = rootLineLeftPoint.translate(0, sin(angle /angleDivider) * - _lineLength);
      //in main line; left point to new down point determining
      var rootLeftPointDownPoint = rootLineLeftPoint.translate(0, sin(angle / angleDivider) *  _lineLength);

      // in the root line; left up point to left down point drawing
      canvas.drawLine(rootLeftPointUpPoint, rootLeftPointDownPoint, paint);


      //recursive; our rootRightPointUpPoint going to new start point
      rootComplexLine(canvas, rootRightPointUpPoint, angle, _lineLength/subLineDivider);

      //recursive; our rootRightPointDownPoint going to new start point
      rootComplexLine(canvas, rootRightPointDownPoint, angle, _lineLength/subLineDivider);

      //recursive; our rootLeftPointUpPoint going to new start point
      rootComplexLine(canvas, rootLeftPointUpPoint, angle, _lineLength/subLineDivider);

      //recursive; our rootLeftPointDownPoint going to new start point
      rootComplexLine(canvas, rootLeftPointDownPoint, angle, _lineLength/subLineDivider);

  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}