import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as Vector;


class PageFlow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test Flow"),
        ),
        body: Flow(
          delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
          children: <Widget>[
            new Container(width: 80.0, height: 80.0, color: Colors.red),
            new Container(width: 80.0, height: 80.0, color: Colors.yellow),
            new Container(width: 80.0, height: 80.0, color: Colors.green),
            new Container(width: 80.0, height: 80.0, color: Colors.blue),
            new Container(width: 80.0, height: 80.0, color: Colors.lightBlue),
            new Container(width: 80.0, height: 80.0, color: Colors.black),
            new Container(width: 80.0, height: 80.0, color: Colors.blueGrey),
            new Container(width: 80.0, height: 80.0, color: Colors.brown),
            new Container(width: 80.0, height: 80.0, color: Colors.black12),

          ],
        ));
  }

}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(
            i,
            transform: new Matrix4.compose(Vector.Vector3(x,y,0.0), Vector.Quaternion(0.0,0.0,0.3,0.1), Vector.Vector3(1.0,1.0,1.0))
        );
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: Matrix4.translationValues(x, y, 0.0) //位移
        );
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, double.infinity);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}