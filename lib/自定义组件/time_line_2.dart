import 'package:flutter/material.dart';

class TimeLine2 extends StatefulWidget {
  const TimeLine2({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TimeLine2State();
  }
}

class _TimeLine2State extends State<TimeLine2> {
  bool _folded1 = false;
  bool _folded2 = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          const Positioned(
            top: 20,
            left: 16,
            bottom: 0,
            child: VerticalDivider(
              width: 1,
              color: Colors.red,
            ),
          ),
          Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('步骤一'),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _folded1 = !_folded1;
                              });
                            },
                            child: const Text('收起'))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, right: 32),
                    child: Container(
                      color: Colors.amber,
                      height: _folded1 ? 100 : 300,
                      child: const Center(
                        child: Text(
                          '步骤一的内容',
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text('步骤二'),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _folded2 = !_folded2;
                              });
                            },
                            child: const Text('收起'))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32, right: 32),
                    child: Container(
                      color: Colors.amber,
                      height: _folded2 ? 100 : 500,
                      child: const Center(
                        child: Text(
                          '步骤二的内容',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
