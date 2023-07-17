import 'package:flutter/material.dart';

class AspectRatioExample extends StatefulWidget {
  const AspectRatioExample({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AspectRatioExampleState();
  }
  
}

class _AspectRatioExampleState extends State<AspectRatioExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        color: Colors.blue,
        alignment: Alignment.center,
        height: 100,
        width: double.infinity,
        child: AspectRatio( //AspectRatio的child自身设置的宽高约束不生效
          aspectRatio: 0.5,
          child: Container(
              color: Colors.green,
              width: 100,
              height: 50,
            ),
        ),
      ),
    ));
  }
}
