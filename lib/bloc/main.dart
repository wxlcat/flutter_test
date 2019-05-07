import 'package:flutter/material.dart';
import 'package:flutter_test_example/bloc/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Bloc _bloc = Bloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(_bloc,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        ));
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
    Bloc bloc = BlocProvider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: IntrinsicWidth(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
                child: Text('PushChildPage'),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => BlocPage()));
                }),
            RaisedButton(
              child: Text('AddBalance'),
              onPressed: () {
                bloc.addBalance();
              },
            ),
            StreamBuilder<num>(
              stream: bloc.balanceStream,
              initialData: 0,
              builder: (ctx, snapshot) {
                return Container(
                  child: Align(
                    child: Text('balance: ${snapshot.data}'),
                    alignment: Alignment.center,
                  ),
                );
              },
            )
          ],
        ))));
  }
}
