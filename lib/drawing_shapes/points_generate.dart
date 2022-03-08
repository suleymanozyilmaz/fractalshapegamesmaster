import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:triangle_fractal/shapes_style_constants.dart';
import 'package:vector_math/vector_math_64.dart';

class PointsGenerate extends CustomPainter {
  double rotationAngle = pi / 4;

  @override
  void paint(Canvas canvas, Size size) {
    double width = 100;
    double height = 150;
    double angle = 0;
    double scale = 1;

    // beyaz koordinatlar için yapıldı testdir
    canvas.drawLine(size.centerLeft(Offset(0, 0)), size.centerRight(Offset(0, 0)), kCustomColorPaint(Color(0xFFE8F5E9))..strokeWidth=1);
    canvas.drawLine(size.topCenter(Offset(0, 0)), size.bottomCenter(Offset(0, 0)), kCustomColorPaint(Color(0xFFE8F5E9))..strokeWidth=1);


    drawRectangle(canvas, size, const Offset(0.0, 0.0), width, height, angle,scale);
  }

  void drawRectangle(Canvas canvas, Size size, Offset center, double width,
      double height, double angle, double scale) {

    int heightDiv = 2;
    int widthDiv = 2;
    var pointDistance = 20.0;

    var leftTop = Offset(-width / widthDiv, -height / heightDiv);
    var rightTop = Offset(width / widthDiv, -height / heightDiv);
    var rightBottom = Offset(width / widthDiv, height / heightDiv);
    var leftBottom = Offset(-width / widthDiv, height / heightDiv);


        //Default Main Rectangle-----------------------------------------------------------
        List<Offset> rectangle = drawWithPointRectangle(
        leftTop: transformPoint(point: leftTop, angle: angle, scale: scale ),
        rightTop: transformPoint(point: rightTop,angle: angle, scale: scale),
        rightBottom: transformPoint(point: rightBottom, angle: angle, scale: scale),
        leftBottom: transformPoint(point: leftBottom, angle: angle, scale: scale),
        pointDistance: pointDistance);
    for (int i = 0; i < rectangle.length - 1; i++) {
      canvas.drawLine(size.center(rectangle[i]),size.center(rectangle[i + 1]),
          kGreenColorPaint..strokeWidth=6);
    }
    //---------------------------------------------------------------------------------------


    double rightTopRectangleAngle = -pi/4;
    var childScale = 0.5;

// büyük dikdörtgenin p23'ünün seçimi
    var anchorIndex = 23;
    var childAnchor = rectangle[anchorIndex];
//-------------------

    // p23'ü scale and rotation edip p'23 buluyoruz
    var childRectangleAttachingPoint = transformPoint(point: childAnchor,angle: rightTopRectangleAngle,scale: childScale);
//------------------

//noktalar arası farkı bulma transform için---------------
    var bigRectangleAttachingPointIndex = 5;
    var r =   rectangle[bigRectangleAttachingPointIndex] - childRectangleAttachingPoint;
//------------------


    // M matrixini noktalar ile çarpıp yeni noktaları elde ettik
    var M = generateMMatrix(r, rightTopRectangleAngle, childScale);



    var newLeftTop = multiplyMMatrixAndPoint(M, leftTop);

    var newRightTop = multiplyMMatrixAndPoint(M, rightTop);

    var newRightBottom = multiplyMMatrixAndPoint(M, rightBottom);

    var newLeftBottom = multiplyMMatrixAndPoint(M, leftBottom);

    var newchildRect = drawWithPointRectangle(
        leftTop: newLeftTop,
        rightTop: newRightTop,
        rightBottom: newRightBottom,
        leftBottom: newLeftBottom,
        pointDistance: pointDistance);



    for (int i = 0; i < newchildRect.length - 1; i++) {
      canvas.drawLine(size.center(newchildRect[i]),size.center(newchildRect[i + 1]),
          kGreenColorPaint..strokeWidth=1);
    }



//SOL ÜST KÜÇÜK DİKDÖRTGEN
    double leftTopRectangleAngle= pi/4;
    // büyük dikdörtgenin p10'ünün seçimi
    var anchorIndex2 = 10;
    var childAnchor2 = rectangle[anchorIndex2];
//-------------------
    // p10'ü scale and rotation edip p'10 buluyoruz
    var childRectangleAttachingPoint2 = transformPoint(point: childAnchor2,angle: leftTopRectangleAngle,scale: childScale);
//------------------

//noktalar arası farkı bulma transform için---------------
    var bigRectangleAttachingPointIndex2 = 0;
    var r2 =   rectangle[bigRectangleAttachingPointIndex2] - childRectangleAttachingPoint2;
//------------------

    // M matrixini oluşturduk
    var M2 = generateMMatrix(r2, leftTopRectangleAngle, childScale);


    // M matrixini noktalar ile çarpıp yeni noktaları elde ettik
    var newLeftTop2 = multiplyMMatrixAndPoint(M2, leftTop);

    var newRightTop2 = multiplyMMatrixAndPoint(M2, rightTop);

    var newRightBottom2 = multiplyMMatrixAndPoint(M2, rightBottom);

    var newLeftBottom2 = multiplyMMatrixAndPoint(M2, leftBottom);
  //-----------------------------------------------------------------------------

    var newchildRect2 = drawWithPointRectangle(
        leftTop: newLeftTop2,
        rightTop: newRightTop2,
        rightBottom: newRightBottom2,
        leftBottom: newLeftBottom2,
        pointDistance: pointDistance);

    for (int i = 0; i < newchildRect.length - 1; i++) {
      canvas.drawLine(size.center(newchildRect2[i]),size.center(newchildRect2[i + 1]),
          kGreenColorPaint..strokeWidth=1);
    }


    //SAĞ ALT KÜÇÜK DİKDÖRTGEN
    double rightBottomRectangleAngle= pi/4;
    // büyük dikdörtgenin p23'ünün seçimi
    var anchorIndex3 = 23;
    var childAnchor3 = rectangle[anchorIndex3];
//-------------------
    // p23'ü scale and rotation edip p'23 buluyoruz
    var childRectangleAttachingPoint3 = transformPoint(point: childAnchor3,angle: rightBottomRectangleAngle,scale: childScale);
//------------------

//noktalar arası farkı bulma transform için---------------
    var bigRectangleAttachingPointIndex3 = 13;
    var r3 =   rectangle[bigRectangleAttachingPointIndex3] - childRectangleAttachingPoint3;
//------------------

    // M matrixini oluşturduk
    var M3 = generateMMatrix(r3, rightBottomRectangleAngle, childScale);


    // M matrixini noktalar ile çarpıp yeni noktaları elde ettik
    var newLeftTop3 = multiplyMMatrixAndPoint(M3, leftTop);

    var newRightTop3 = multiplyMMatrixAndPoint(M3, rightTop);

    var newRightBottom3 = multiplyMMatrixAndPoint(M3, rightBottom);

    var newLeftBottom3 = multiplyMMatrixAndPoint(M3, leftBottom);
    //-----------------------------------------------------------------------------

    var newchildRect3 = drawWithPointRectangle(
        leftTop: newLeftTop3,
        rightTop: newRightTop3,
        rightBottom: newRightBottom3,
        leftBottom: newLeftBottom3,
        pointDistance: pointDistance);

    for (int i = 0; i < newchildRect.length - 1; i++) {
      canvas.drawLine(size.center(newchildRect3[i]),size.center(newchildRect3[i + 1]),
          kGreenColorPaint..strokeWidth=1);
    }


    //SOL ALT KÜÇÜK DİKDÖRTGEN
    double leftBottomRectangleAngle= -pi/4;
    // büyük dikdörtgenin p10'ünün seçimi
    var anchorIndex4 = 10;
    var childAnchor4 = rectangle[anchorIndex4];
//-------------------
    // p10'ü scale and rotation edip p'10 buluyoruz
    var childRectangleAttachingPoint4 = transformPoint(point: childAnchor4,angle: leftBottomRectangleAngle,scale: childScale);
//------------------

//noktalar arası farkı bulma transform için---------------
    var bigRectangleAttachingPointIndex4 = 19;
    var r4 =   rectangle[bigRectangleAttachingPointIndex4] - childRectangleAttachingPoint4;
//------------------

    // M matrixini oluşturduk
    var M4 = generateMMatrix(r4, leftBottomRectangleAngle, childScale);


    // M matrixini noktalar ile çarpıp yeni noktaları elde ettik
    var newLeftTop4 = multiplyMMatrixAndPoint(M4, leftTop);

    var newRightTop4 = multiplyMMatrixAndPoint(M4, rightTop);

    var newRightBottom4 = multiplyMMatrixAndPoint(M4, rightBottom);

    var newLeftBottom4 = multiplyMMatrixAndPoint(M4, leftBottom);
    //-----------------------------------------------------------------------------

    var newchildRect4 = drawWithPointRectangle(
        leftTop: newLeftTop4,
        rightTop: newRightTop4,
        rightBottom: newRightBottom4,
        leftBottom: newLeftBottom4,
        pointDistance: pointDistance);

    for (int i = 0; i < newchildRect.length - 1; i++) {
      canvas.drawLine(size.center(newchildRect4[i]),size.center(newchildRect4[i + 1]),
          kGreenColorPaint..strokeWidth=1);
    }










  }






  Matrix3 generateMMatrix(Offset r, double angle, double scale){
    var T =
    Matrix3(1, 0, 0,
            0, 1, 0,
            r.dx, r.dy, 1);

    var R = Matrix3.rotationZ(angle);

    var S = Matrix3(scale, 0, 0, 0, scale, 0, 0, 0, 1);
    var M = T * R * S ;
    return M;
  }


  Offset multiplyMMatrixAndPoint( Matrix3 M, Offset point) {
    Vector3 vectorPoint = Vector3(point.dx, point.dy, 1);
    var result = M * vectorPoint;
    return Offset(result[0],result[1]);
  }


  // Point Transform Method
  Offset transformPoint(
      {required Offset point, double? scale = 1, double? angle = 0}) {
    var R = Matrix3.rotationZ(angle!);

    var S = Matrix3(scale!, 0, 0, 0, scale, 0, 0, 0, 1);
    var pointVector = Vector3(point.dx, point.dy, 1);
    var p = R * S * pointVector;

    return Offset(p[0], p[1]);
  }



  //Rotating single point
  Offset rotatePoint(Offset point, {double? angle = 0}) {
    var myMatrix = Matrix3.rotationZ(angle!);
    var myVector = Vector3(point.dx, point.dy, 1);
    var rotatedVector = myMatrix * myVector;
    return Offset(rotatedVector[0], rotatedVector[1]);
  }

  //Scale single point
  Offset scalePoint(Offset point, {double? rate = 1}) {
    var myMatrix = Matrix3(rate!, 0, 0, 0, rate, 0, 0, 0, 1);
    var myVector = Vector3(point.dx, point.dy, 1);
    var scaledVector = myMatrix * myVector;
    return Offset(scaledVector[0], scaledVector[1]);
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



  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
