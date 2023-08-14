import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_app/%E8%B7%AF%E7%94%B1/router_root.dart';
import 'package:my_app/GetX/getx.dart';
import 'package:my_app/MDC103/login_page.dart';
// import 'package:my_app/camera_page.dart';
import 'package:my_app/english_words_page.dart';
import 'package:my_app/test.dart';
import 'package:my_app/todo_list_page.dart';
import 'package:my_app/widget%E7%BB%84%E4%BB%B6/aspect_ratio.dart';
import 'package:my_app/widget%E7%BB%84%E4%BB%B6/custom_single_child_layout.dart';
import 'package:my_app/widget%E7%BB%84%E4%BB%B6/list_view.dart';
import 'MDC103/color.dart';
import 'package:my_app/tabbar联动/tabbar.dart';
import 'package:my_app/自定义组件/custom_picker_view.dart';

ThemeData buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: kShrinePink100,
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
  );
}

final ThemeData kShrineTheme = buildShrineTheme();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // _cameras = await availableCameras();
  /**
  runApp(MaterialApp(
    // showPerformanceOverlay: true,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(appBarTheme: const AppBarTheme(elevation: 0)),
    title: 'Shrine',
    home: const MyTabbar(),
  ));
   */
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyTabbar(),
    );
  }
}
