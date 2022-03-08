
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


  Paint kRandomColorPaint = Paint()
    ..color = Color(Random().nextInt(0xffffffff))
    ..strokeWidth = 2;

  Paint kGreenColorPaint = Paint()
   ..color = Colors.green
   ..strokeWidth = 2;

Paint kRedColorPaint = Paint()
  ..color = const Color(0xffB91646)
  ..strokeWidth = 2;

Paint kCustomColorPaint(Color color,{double? width = 2.0}) => Paint()
  ..color = color
  ..strokeWidth = width!;





