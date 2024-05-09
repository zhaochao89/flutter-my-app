import 'package:flutter/material.dart';
import 'package:my_app/自定义组件/time_line_2.dart';

class MyMessagePage extends StatefulWidget {
  const MyMessagePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyMessagePageState();
  }
}

class _MyMessagePageState extends State<MyMessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('消息'),
      ),
      body: const TimeLine2(),
    );
  }
}
