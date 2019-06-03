import 'package:flutter/material.dart';


class PageListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.add_shopping_cart),
              title: Text('历史记录'),
              trailing: Icon(Icons.chevron_right),
            ),
            Text('a'),
            Text('a'),
            Column(
              children: <Widget>[
                Text('a'),
                Text('a'),
                Text('a'),
                Text('a'),
                Text('a')
              ],
            )
          ],

        ),

      ),
    );
  }

}