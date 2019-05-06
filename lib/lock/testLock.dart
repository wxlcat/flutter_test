import 'dart:async';
import 'package:synchronized/synchronized.dart';


class TestInstance1 {

  static TestInstance1 _instance;

  TestInstance1();

  static Future<TestInstance1> getInstance(String name, bool waitMount) async {

    if(_instance == null) {
      _instance = new TestInstance1();
      print('$name: tag1');
      if(waitMount){
        print('$name: wait 1 seconds');
        await Future.delayed(Duration(seconds: 1));
      }
      String ret = await _instance.init();
      print('$name: init returned $ret');
    }
    else{
      print('$name: tag2');
    }

    return _instance;
  }


  Future<String> init() async {
    await Future.delayed(Duration(seconds: 2));
    return '666';
  }

}

class TestInstance2 {

  static TestInstance2 _instance;

  TestInstance2();


  static Lock _lock = Lock();
  static Future<TestInstance2> getInstance(String name, bool delay) async {

    if(_instance != null) {
      print('$name _instance != null');
      return _instance;
    }

    await _lock.synchronized(() async {
      print('$name enter lock');

      if(_instance == null) {
        if(delay){
          print('$name delay 2 seconds');
          await Future.delayed(Duration(seconds:2));
        }

        print('$name new');
        var ins = TestInstance2();
        await ins.init();
        _instance = ins;
        print('$name _instance = ins');
      }

      print('$name leave lock');

    });

    print('$name return');

    return _instance;
  }

  Future<String> init() async {
    await Future.delayed(Duration(seconds: 2));
    return '666';
  }

}



class TestLock {

  void test1() {
    TestInstance1.getInstance('a', true);
    TestInstance1.getInstance('b', false);
  }

  void test2() {
    TestInstance2.getInstance('a', true);
    TestInstance2.getInstance('b', false);
  }

}