import 'dart:async';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_app/test.dart';

late List<CameraDescription> _cameras;

/// CameraApp is the Main Application.
class CameraApp extends StatefulWidget {
  /// Default Constructor
  const CameraApp({Key? key}) : super(key: key);

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;
  int count = 0;
  //实现局部刷新
  final StreamController<int> streamController = StreamController();
  final GlobalKey<TestPageTwoState> testKey = GlobalKey();
  final ValueNotifier<int> _notifier = ValueNotifier<int>(0);
  late StateSetter _reloadTextSetter;

  @override
  void initState() {
    super.initState();
    debugPrint('===_CameraAppState initState===');
    // controller = CameraController(_cameras[0], ResolutionPreset.max);
    // controller.initialize().then((_) {
    //   if (!mounted) {
    //     return;
    //   }
    //   setState(() {});
    // }).catchError((Object e) {
    //   if (e is CameraException) {
    //     switch (e.code) {
    //       case 'CameraAccessDenied':
    //         // Handle access errors here.
    //         break;
    //       default:
    //         // Handle other errors here.
    //         break;
    //     }
    //   }
    // });
  }

  @override
  void didUpdateWidget(covariant CameraApp oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("===main didUpdateWidget===");
  }

  @override
  void dispose() {
    controller.dispose();
    //关流，避免内存泄露
    streamController.close();
    _notifier.dispose();
    super.dispose();
  }

  Widget _buildThreeWidget(BuildContext context, int value, Widget? child) {
    return TestPageThree(count: value);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("======_CameraAppState build===");
    // if (!controller.value.isInitialized) {
    //   return Container();
    // }
    // return MaterialApp(
    //   home: CameraPreview(controller),
    // );
    return Column(
      children: [
        const SizedBox(
          height: 88,
        ),
        Expanded(child: ZCTest(count: count)),
        StreamBuilder<int>(
          stream: streamController.stream,
          initialData: count,
          builder: (context, snapshot) {
            return Expanded(child: TestPageOne(count: count));
          },
        ),
        Expanded(
            child: TestPageTwo(
          key: testKey,
        )),
        Expanded(
            child: ValueListenableBuilder<int>(
                valueListenable: _notifier, builder: _buildThreeWidget)),
        Expanded(child: StatefulBuilder(builder: (context, stateSetter) {
          _reloadTextSetter = stateSetter;
          return ZCTest(count: count);
        })),
        Wrap(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    count--;
                  });
                },
                child: const Text('setState全部刷新')),
            ElevatedButton(
                onPressed: () {
                  count++;
                  streamController.add(count);
                },
                child: const Text('StreamBuilder局部刷新')),
            ElevatedButton(
                onPressed: () {
                  count++;
                  testKey.currentState?.updateCount(count);
                },
                child: const Text('GlobalKey局部刷新')),
            ElevatedButton(
                onPressed: () {
                  _notifier.value += 1;
                },
                child: const Text('ValueNotifier局部刷新')),
            ElevatedButton(
                onPressed: () {
                  count++;
                  _reloadTextSetter(() {});
                },
                child: const Text('StatefulBuilder局部刷新')),
          ],
        ),
        const SizedBox(
          height: 34,
        )
      ],
    );
  }
}
