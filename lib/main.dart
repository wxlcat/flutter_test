import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test_example/page/page_mainAxisSize.dart';
import 'package:flutter_test_example/page/page_unbonded_constraints.dart';
import 'package:flutter_test_example/page/page_expanded.dart';
import 'package:flutter_test_example/page/page_loading.dart';


void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            RaisedButton(
              child: Text('mainAxisSize.min'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return PageMainAxisSize();
                }));
              },
            ),

            RaisedButton(
              child: Text('unbounded constrains'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return PageUnboundedConstraints();
                }));
              },
            ),

            RaisedButton(
              child: Text('Expanded'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return PageExpanded();
                }));
              },
            ),

            RaisedButton(
              child: Text('loading'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx){
                  return PageLoading();
                }));
              },
            ),



          ],
        ),
      ),

    );
  }
}
