import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

enum CustomLoadingMode { replace, overlay }

class CustomLoading extends StatefulWidget {
  final Widget child;
  final LoadingController controller;
  final CustomLoadingMode mode;

  CustomLoading(
      {this.child,
      @required this.controller,
      this.mode = CustomLoadingMode.overlay});

  @override
  State<StatefulWidget> createState() {
    return _CustomLoadingState();
  }
}

class LoadingController {
  PublishSubject<Future<void>> sub = PublishSubject<Future<void>>();

  void loading(Future<void> future) {
    sub.add(future);
  }

  Stream get stream {
    return sub.stream;
  }
}

class _CustomLoadingState extends State<CustomLoading> {
  bool _showLoading = false;
  StreamSubscription subscrip;

  @override
  void initState() {
    super.initState();
    subscrip = widget.controller.sub.listen(onEvent);
  }

  @override
  void dispose() {
    subscrip.cancel();
    super.dispose();
  }

  void onEvent(Future<void> future) async {
    if (future == null) return;

    _showLoading = true;
    setState(() {});
    future.whenComplete(() {
      _showLoading = false;
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.mode == CustomLoadingMode.overlay)
      return buildOverlay();
    else
      return buildReplace();
  }

  Widget buildOverlay() {
    return Stack(children: createBody());
  }

  Widget buildReplace() {
    if (_showLoading)
      return createLoading();
    else
      return widget.child;
  }

  List<Widget> createBody() {
    List<Widget> list = [widget.child];
    if (_showLoading) list.add(createLoading());
    return list;
  }

  Widget createLoading() {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
