
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../chart_view.dart';

class SleepPainter extends CustomPainter{

  List<SleepModel> list;

  // 整个过程持续的时间
  int duration;

  SleepPainter(this.list,this.duration);

  @override
  void paint(Canvas canvas, Size size) {

    assert(size.height > 0 || size.width > 0 , '布局错误,子视图不能确定其大小，无法计算相应的数据');

    if(size.height == 0 || size.width == 0){
      return;
    }
    if(list.length == 0){
      return;
    }

    double oneHeight = size.height / list.length;
    double oneWidth = size.width / duration;

    for(int i = 0; i < list.length; i++){
      var model = list[i];
      /*
      * PaintingStyle.stroke 边框
      * PaintingStyle.fill   内部填充
      * */
      Paint _paint = Paint()..style = PaintingStyle.fill
        ..color = model.color;
      double y = oneHeight * i;
      var path = Path();

      for(var range in model.lists){
        double x_left = range.start * oneWidth;
        double x_right = range.end * oneWidth;
        path.moveTo(x_left, y);
        path.addRect(Rect.fromLTWH(x_left, y, x_right - x_left, oneHeight));
      }
      canvas.drawPath(path, _paint);
    }
  }

  /*
  *
  * 因为我们每次是重新构建 CustomPaint 组件，但是其背后的 RenderCustomPaint 是不变的，
  * RenderCustomPaint 会根据 shouldRepaint 的值来决定当 Widget 变化的时候是否发生绘制。
  * */
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;//this != oldDelegate;
  }

}
