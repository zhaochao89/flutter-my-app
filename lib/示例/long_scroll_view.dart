import 'package:flutter/material.dart';
import 'package:my_app/gen_a/A.dart';

class LongScrollView extends StatefulWidget {
  const LongScrollView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LongScrollViewState();
  }
}

class _LongScrollViewState extends State<LongScrollView> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    //监听滚动事件，当在初始位置时，禁止下拉
    _controller.addListener(() {
      //打印滚动偏移量
      print(_controller.offset);
      if (_controller.offset <= 0) {
        _controller.jumpTo(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.constrainHeight(),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(A.assets_ico_bg), fit: BoxFit.cover),
                ),
                width: constraints.constrainWidth(),
                height: 300,
                child: const Column(
                  children: [
                    SizedBox(
                      height: 44,
                    ),
                    SizedBox(
                      height: 44,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          SizedBox(
                            width: 32,
                            child: Text('返回'),
                          ),
                          Expanded(
                            child: Center(
                              child: Text('长列表'),
                            ),
                          ),
                          SizedBox(
                            width: 48,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 88,
                bottom: 0,
                left: 0,
                right: 0,
                child: SingleChildScrollView(
                  controller: _controller,
                  child: Column(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('这是第一行文字'),
                          SizedBox(
                            height: 8,
                          ),
                          Text('这是第二行文字'),
                          SizedBox(
                            height: 8,
                          ),
                          Text('这是第三行文字'),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.amber,
                        height: 800,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
