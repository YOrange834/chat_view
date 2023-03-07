


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinePainter extends CustomPainter{

  Color lineColor;
  double lineWidth;

  LinePainter({this.lineColor = Colors.black,this.lineWidth = 2});

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint();
    _paint.strokeWidth = lineWidth;
    _paint.color = lineColor;
    canvas.drawLine(Offset.zero, Offset(0, size.height), _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}