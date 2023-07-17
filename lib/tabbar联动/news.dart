import 'package:flutter/material.dart';

class MyNewsPage extends StatefulWidget {
  const MyNewsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyNewsPageState();
  }
}

class _MyNewsPageState extends State<MyNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('新闻'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.newspaper_outlined),
              title: Text('这是新闻$index'),
              subtitle: Text('这是新闻$index的详细信息'),
            );
          },
          itemCount: 30,
        ));
  }
}
