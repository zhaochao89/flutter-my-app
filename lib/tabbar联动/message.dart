import 'package:flutter/material.dart';

class MyMessagePage extends StatefulWidget {
  const MyMessagePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyMessagePageState();
  }
}

class _MyMessagePageState extends State<MyMessagePage> {
  bool _folded1 = false;
  bool _folded2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('消息'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              fit: StackFit.loose,
              children: [
                const Positioned(
                  top: 12,
                  left: 16,
                  bottom: 0,
                  child: Column(
                    children: [
                      Icon(Icons.circle),
                      //竖线
                      Expanded(
                        child: VerticalDivider(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 44, right: 32, bottom: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('步骤一'),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _folded1 = !_folded1;
                              });
                            },
                            child: const Text('收起'),
                          ),
                        ],
                      ),
                      Card(
                        color: Colors.amber,
                        child: SizedBox(
                          width: double.infinity,
                          height: _folded1 ? 50 : 500,
                          child: const Text('这是步骤一的内容'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              fit: StackFit.loose,
              children: [
                const Positioned(
                  top: 12,
                  left: 16,
                  bottom: 0,
                  child: Column(
                    children: [
                      Icon(Icons.circle),
                      //竖线
                      // Expanded(
                      //   child: VerticalDivider(
                      //     width: 1,
                      //     color: Colors.red,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 44, right: 32, bottom: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('步骤二'),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _folded2 = !_folded2;
                              });
                            },
                            child: const Text('收起'),
                          ),
                        ],
                      ),
                      Card(
                        color: Colors.amber,
                        child: SizedBox(
                          width: double.infinity,
                          height: _folded2 ? 50 : 500,
                          child: const Text('这是步骤二的内容'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
