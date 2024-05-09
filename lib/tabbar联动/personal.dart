import 'package:flutter/material.dart';
import 'package:my_app/示例/long_scroll_view.dart';

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
    return const Scaffold(
      body: LongScrollView(),
    );
  }
}
