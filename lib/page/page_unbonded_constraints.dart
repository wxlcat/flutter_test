import 'package:flutter/material.dart';

class PageUnboundedConstraints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: createListViewInColumn(),
    );
  }

  Widget createListViewInColumn() {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListView(
          shrinkWrap: true,
          children: createList(),
        )
      ],
    ));
  }

  Widget createListView() {
    return ListView(
      children: createList(),
    );
  }

  List<Widget> createList() {
    List<Widget> list = List<Widget>();
    for (int i = 0; i < 100; i++) {
      list.add(Text('$i'));
    }
    return list;
  }
}
