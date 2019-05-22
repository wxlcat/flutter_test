import 'package:flutter/material.dart';

class PageExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              child: Text('Hello World'),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text('Hello World'),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                child: Text('Hello World'),
              ),
            ),
            FittedBox(
              fit: BoxFit.fill,
              child: RaisedButton(
                child: Text('Hello World FittedBox'),
              ),
            ),
            SizedBox(

            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: RaisedButton(
                    child: Text('Hello World'),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: RaisedButton(
                    child: Text('Hello World'),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    child: Text('Hello World'),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
