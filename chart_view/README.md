<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Health project - Sleep_chartView

## Features

Fixed bugs and Perfect functions

## Getting started

```
$ dart pub add chart_view
```



## Usage



```dart
Widget drawSleep(){
    List<SleepModel> lists = [];
    {
      SleepModel one = SleepModel(Colors.red, []);
      one.descr = "醒着";
      lists.add(one);
    }
    {
      SleepModel one = SleepModel(Colors.grey, []);
      one.descr = "快速眼动";
      lists.add(one);
    }
    {
      SleepModel one = SleepModel(Colors.green, []);
      one.descr = "浅睡";
      lists.add(one);
    }
    {
      SleepModel one = SleepModel(Colors.blue, []);
      one.descr = "深睡";
      lists.add(one);
    }

    int index = -1;

    SleepModel? beforeModel;

    for(int i = 0; i < 60 * 7; i++){
      var a = Random().nextInt(99) + 0;
      // var b = a.floor();

      if(a < 81){
        index = 3;
      }else if(a < 95){
        index = 2;
      }else if(a < 98){
        index = 1;
      }else{
        index = 0;
      }
      SleepModel nowModel = lists[index];

      if(beforeModel != nowModel){ //上一个还是这个数据
        if(beforeModel != null){
          Range values = beforeModel.lists.last;
          values.end = i;
          // print("$a 开始：${values.start}  结束：${values.end}");
          // print("开始：${beforeModel.descr}  结束：${nowModel.descr}");
        }
        Range values = Range(i, i+1);
        nowModel.lists.add(values);
      }else{
        if(i == 7 * 60 - 1 && beforeModel != null){
          Range values = beforeModel.lists.last;
          values.end = i;
          print("开始：${values.start}  结束：${values.end}");
        }
      }
      beforeModel = nowModel;
    }
    return Expanded(child: SleepWidget(lists, 23 * 60, 6 * 60));
  }
```

## Additional information

