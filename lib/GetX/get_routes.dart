import 'package:get/get.dart';
import 'package:my_app/GetX/getx_login.dart';
import 'package:my_app/GetX/getx_one.dart';
import 'package:my_app/GetX/getx_three.dart';
import 'package:my_app/GetX/getx_two.dart';
import 'package:my_app/GetX/increment.dart';
import 'package:my_app/GetX/middleware.dart';

class GetRoutes {
  static final pages = [
    GetPage(name: '/home', page: () => const InCrementPage()),
    GetPage(name: '/one', page: () => GetXOnePage()),
    GetPage(name: '/two', page: () => GetXTwoPage()),
    GetPage(
        name: '/three',
        page: () => const GetXThreePage(),
        middlewares: [Middleware()]),
    GetPage(
        name: '/login',
        page: () => const GetxLoginPage(),
        transition: Transition.downToUp,
        fullscreenDialog: true), // 设置fullscreenDialog为true可以解决跳转动画问题。
  ];
}
