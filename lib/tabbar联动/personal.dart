import 'package:flutter/material.dart';

class MyPersonalPage extends StatefulWidget {
  const MyPersonalPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyPersonalPageState();
  }
}

class _MyPersonalPageState extends State<MyPersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('个人中心'),),
      body: const Center(child: Text('个人中心'),),
    );
  }
}