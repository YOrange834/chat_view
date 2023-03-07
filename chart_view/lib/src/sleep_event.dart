

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../chart_view.dart';

class SleepEvent extends StatefulWidget{

  Color lineColor = Colors.black;
  double lineWidth = 2;

  List<SleepModel> list;
  // 整个过程持续的时间
  int duration;
  int startTime;
  SleepEvent(this.list,this.duration,this.startTime);

  @override
  State<StatefulWidget> createState() => _SleepEventState();

}

class _SleepEventState extends State<SleepEvent>{

  double left = 0;
  double rect_x = 0;
  String des = "";
  String startStr = "";
  String endStr = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        child: Visibility(
          visible: left > 0,
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  bottom: 0,
                  left: left,
                  width: widget.lineWidth,
                  child: CustomPaint(
                    painter: LinePainter(lineColor: widget.lineColor,lineWidth: widget.lineWidth),
                  )
              ),
              Positioned(
                  top: 0,
                  left: rect_x,
                  width: 80,
                  height: 40,
                  child: Container(
                    color: Colors.blue,
                    // width: 80,
                    // height: 60,
                    child: Row(
                      children: [
                        Container(
                          width: 39,
                          child: Column(
                            children: [
                              Container(
                                  height: 19,
                                  child: Text(startStr)),
                              Container(
                                height: 1,
                              ),
                              Container(height: 20,
                                  child: Text(endStr)
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          width: 1,
                        ),
                        Container(
                          width: 40,
                          child: Text(des),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
      onPanDown: _onTap,
      onPanUpdate: _onUpdate,
      onPanCancel: _onCancel,
      onPanEnd: _onEnd,
    );
  }

  void _onTap(DragDownDetails detail) {
    x_left(detail.localPosition.dx);
  }

  // 移动数据点
  void _onUpdate(DragUpdateDetails detail) {
    x_left(detail.localPosition.dx);
  }

  // 移动数据点
  void _onEnd(DragEndDetails details) {
    over();
  }

  // 移动数据点
  void _onCancel() {
    over();
  }

  void x_left(double x){
    if(x < 0 || x > context.size!.width){
      return;
    }

    if(context.size != null){

      if(x > context.size!.width){
        return;
      }

      if(x > 40){
        if(context.size != null ){
          if(x + 40 > context.size!.width){
            rect_x =  context.size!.width - 40;
          }else{
            rect_x = x - 40;
          }
        }else{
          rect_x = x - 40;
        }
      }

      double time = x / context.size!.width * widget.duration;
      for(var model in widget.list){
        for(var range in model.lists){
          if(time >= range.start && time < range.end){
            des = model.descr;
            int s = range.start + widget.startTime;
            int e = range.end + widget.startTime;
            if(s > 24 * 60){
              s = s - 24 * 60;
              e = e - 24 * 60;
            }else{
              if(range.end + widget.startTime > 24 * 60){
                e = e - 24 * 60;
              }
            }
            startStr = (s ~/ 60).toString() + ":" + (s % 60).toString();
            endStr = (e ~/ 60).toString() + ":" + (e % 60).toString();
            break;
          }
        }
      }
    }


    setState(() {left = x;});
  }

  void over(){
    setState(() {    left = -1;});
  }

}