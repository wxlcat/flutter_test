import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class BlocPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Bloc bloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('BlocPage'),
      ),
      body: Container(
          child: Center(
            child: StreamBuilder(
                initialData: 0,
                stream: bloc.balanceStream,
                builder: (context, snapshot) {
                  print('receive ${snapshot.data}');
                  return Text('${snapshot.data}');
                }
            ),
          )
      ),
    );

  }
}

class BlocProvider extends InheritedWidget {

  final Bloc _bloc;

  Bloc get bloc => _bloc;

  BlocProvider(this._bloc, { Key key, Widget child })
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Bloc of(BuildContext context) {
    InheritedWidget iw = context.inheritFromWidgetOfExactType(BlocProvider);
    BlocProvider bp = iw as BlocProvider;
    return bp.bloc;
  }

}


class Bloc {

  num _balance = 0;
  BehaviorSubject<num> _balanceSub = BehaviorSubject.seeded(0);

  Stream get balanceStream => _balanceSub.stream;

  void addBalance() {
    _balanceSub.sink.add(++_balance);
  }

}