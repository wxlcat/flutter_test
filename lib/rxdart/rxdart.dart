import 'package:rxdart/rxdart.dart';


class TestRXDart {

  void testPublishSubject() {

    var sub = PublishSubject<int>();

    sub.listen((data) {
      print('A $data');
    });

    sub.add(1);
    sub.add(2);

    sub.listen((data) {
      print('B $data');
    });

    sub.add(3);
    sub.add(4);
  }

  void testBehaviourSubject() {
    var sub = BehaviorSubject.seeded(0);

    sub.listen((data) {
      print('A $data');
    });

    sub.add(1);
    sub.add(2);

    sub.listen((data) {
      print('B $data');
    });

    sub.add(3);
    sub.add(4);
  }

  void testReplaySubject() {
    var sub = ReplaySubject<int>();

    sub.listen((data) {
      print('A $data');
    });

    sub.add(1);
    sub.add(2);

    sub.listen((data) {
      print('B $data');
    });

    sub.add(3);
    sub.add(4);
  }



}