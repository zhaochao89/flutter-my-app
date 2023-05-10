import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_app/MDC103/login_page.dart';
// import 'package:my_app/camera_page.dart';
import 'package:my_app/english_words_page.dart';
import 'package:my_app/test.dart';
import 'package:my_app/todo_list_page.dart';
import 'MDC103/color.dart';

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
  runApp(const MaterialApp(
    title: 'Shrine',
    home: LoginPage(),
  ));
}
