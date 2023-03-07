
import 'package:chart_view/src/sleep_painter.dart';
import 'package:flutter/cupertino.dart';

import '../chart_view.dart';

class SleepWidget extends StatefulWidget{

  List<SleepModel> list;
  // 整个过程持续的时间
  int duration = 0;
  // 开始时间，单位为分；如果是 23点 则 startTime = 23 * 60；
  int startTime;
  int endTime;
  EdgeInsets? margin = EdgeInsets.zero;

  SleepWidget(this.list,this.startTime,this.endTime,{this.margin}){
    if(startTime < endTime){
      this.duration = endTime - startTime;
    }else{
      this.duration = endTime + 24 * 60 - startTime;
    }
  }

  @override
  State<StatefulWidget> createState() {
    return _SleepState();
  }

}

class _SleepState extends State<SleepWidget>{

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: _drawSleepChartView(),
    );
  }

  Widget _drawSleepChartView(){
    return Container(
      child: Stack(
        fit: StackFit.expand, //子Widget的大小和父组件一样大
        children: [
          CustomPaint(painter: SleepPainter(this.widget.list,this.widget.duration),),
          SleepEvent(this.widget.list,this.widget.duration,this.widget.startTime)
        ],
      ),
      height: double.infinity,
    );
  }
}