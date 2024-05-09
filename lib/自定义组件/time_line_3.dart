import 'package:flutter/material.dart';
import 'package:my_app/gen_a/A.dart';

class TimeLine3 extends StatefulWidget {
  const TimeLine3({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TimeLine3State();
  }
}

class _TimeLine3State extends State<TimeLine3> {
  bool _folded1 = false;
  bool _folded2 = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            fit: StackFit.loose,
            children: [
              const Positioned(
                top: 24,
                left: 32,
                bottom: 0,
                child: VerticalDivider(
                  width: 1,
                  color: Colors.red,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 32, 0),
                    child: SizedBox(
                      height: 24,
                      child: Row(
                        children: [
                          Image.asset(
                            A.assets_ico_circle,
                            width: 32,
                            height: 32,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text('步骤一'),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _folded1 = !_folded1;
                              });
                            },
                            style: TextButton.styleFrom(
                              // backgroundColor: Colors.blue,
                              minimumSize: const Size(80, 24),
                              padding: const EdgeInsets.all(0),
                            ),
                            child: const Text('收起'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(64, 0, 32, 32),
                    child: Container(
                      height: _folded1 ? 100 : 300,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Stack(
            fit: StackFit.loose,
            children: [
              const Positioned(
                top: 30,
                left: 16,
                bottom: 0,
                child: VerticalDivider(
                  width: 1,
                  color: Colors.transparent,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 32, 0),
                    child: SizedBox(
                      height: 24,
                      child: Row(
                        children: [
                          Image.asset(
                            A.assets_ico_circle,
                            width: 32,
                            height: 32,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text('步骤二'),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _folded2 = !_folded2;
                              });
                            },
                            style: TextButton.styleFrom(
                              // backgroundColor: Colors.blue,
                              minimumSize: const Size(80, 24),
                              padding: const EdgeInsets.all(0),
                            ),
                            child: const Text('收起'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(64, 0, 32, 32),
                    child: Container(
                      height: _folded2 ? 100 : 300,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MySeparatorVertical extends StatelessWidget {
  final Color color;

  const MySeparatorVertical({super.key, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final height = constraints.constrainHeight();
        const dashWidth = 4.0;
        final dashCount = (height / (2 * dashWidth)).floor();

        //实线
        // return Flex(
        //   direction: Axis.vertical,
        //   children: [
        //     Container(
        //       width: 1,
        //       height: height,
        //       color: color,
        //     )
        //   ],
        // );

        //虚线
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.vertical,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: 1,
                height: dashWidth,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: color),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
