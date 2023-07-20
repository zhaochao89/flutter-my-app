import 'package:flutter/material.dart';

class RouterDetailPage extends StatefulWidget {
  static const routeName = '/detail';


  const RouterDetailPage({super.key, required this.arguments});

  final Map arguments;

  @override
  State<StatefulWidget> createState() {
    return _RouterDetailPageState();
  }
}

class _RouterDetailPageState extends State<RouterDetailPage> {

  late Map _arguments;

  @override
  void initState() {
    super.initState();
    _arguments = widget.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('命名路由传参页面'),),
      body: Center(
        child: Text(_arguments['content']),
      ),
    );
  }
}