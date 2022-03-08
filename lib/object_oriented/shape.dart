
import 'package:flutter/cupertino.dart';
import 'package:vector_math/vector_math.dart';

abstract class Shape {
   List<Offset> points = <Offset>[];
   bool isCircle = false;

   Matrix3 M = Matrix3(1,     0,     0,
                       0,     1,      0,
                      0,    0,      1);

    void scale(double rate) {
     var S = Matrix3(rate, 0, 0, 0, rate, 0, 0, 0, 1);
     M = S * M;
   }

   void rotate(double angle) {
     var R =  Matrix3.rotationZ(angle);
     M = R * M;
   }

   void translate(Offset r) {
     var T =
     Matrix3(1, 0, 0,
         0, 1, 0,
         r.dx, r.dy, 1);
     M = T * M;
   }

   List<Offset> getTransformedVertice(){
      List<Offset> transformedPoints = [];
      for (Offset point in points){
        var myVector = Vector3(point.dx, point.dy, 1);
        var scaledVector = M * myVector;
         transformedPoints.add(Offset(scaledVector[0], scaledVector[1]));
      }
      return transformedPoints;
   }

   Offset getTransformedVertex(int index){
        Offset point = points[index];
       var myVector = Vector3(point.dx, point.dy, 1);
       var scaledVector = M * myVector;
       return (Offset(scaledVector[0], scaledVector[1]));
   }


  double getSize(){
      return 0;
}

}