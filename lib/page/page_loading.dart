import 'package:flutter/material.dart';
import 'package:flutter_test_example/widget/custom_loading.dart';

class PageLoading extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageLoadingState();
  }
}

class _PageLoadingState extends State<PageLoading> {
  LoadingController ctl = LoadingController();
  List<String> list = ['A', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            child: CustomLoading(controller: ctl, mode: CustomLoadingMode.overlay, child: createBody())));
  }

  Future<void> request() async {
    print('start');
    await Future.delayed(Duration(seconds: 5));
    list.addAll(['a', 'b', 'c']);
    if(mounted)
      setState(() {});
    print('end');
  }

  void onPressed() {
    Future<void> future = request();
    ctl.loading(future);
  }

  Widget createBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        RaisedButton(
          child: Text('request'),
          onPressed: onPressed,
        ),
        Column(
            children: list.map<Widget>((val) {
          return Text('$val');
        }).toList())
      ],
    );
  }
}
