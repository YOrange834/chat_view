
import 'dart:ui';

class SleepModel{
  // 对序号的描述，深睡，潜睡，快速动眼等
  String descr;
  // 填充的颜色
  Color color;
  // 数据区间
  List<Range> lists;

  SleepModel(this.color,this.lists,{this.descr = ""});
}


class Range {
  final int start;
  int end;
  Range(this.start,this.end);
}