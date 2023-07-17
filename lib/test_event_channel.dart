import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestEventChannelPage extends StatefulWidget {
  const TestEventChannelPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TestEventChannelPageState();
  }
}

class _TestEventChannelPageState extends State<TestEventChannelPage> {
  static const EventChannel _eventChannel = EventChannel('com.cn.test.event');
  late StreamSubscription _streamSubscription;
  late String _text;

  @override
  void initState() {
    _streamSubscription = _eventChannel.receiveBroadcastStream().listen((event) {
      print('====$event====');
      setState(() {
        _text = event;
      });
     }, onError: (error) {
      print('====$error====');
     });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_text),
      ),
    );
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}