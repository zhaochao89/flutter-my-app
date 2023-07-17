import 'package:flutter/material.dart';

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
        body: const Text('消息'));
  }
}
