import 'package:flutter/material.dart';
import 'package:flutter_test_example/rxdart/rxdart.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

  TestRXDart _rxDart = TestRXDart();

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


        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                child: Text('TestPublishSubject'),
                onPressed: (){
                  _rxDart.testPublishSubject();
                },
              ),
              RaisedButton(
                child: Text('testBehaviourSubject'),
                onPressed: (){
                  _rxDart.testBehaviourSubject();
                },
              ),
              RaisedButton(
                child: Text('testReplaySubject'),
                onPressed: (){
                  _rxDart.testReplaySubject();
                },
              )
            ],
          ),
        )
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
