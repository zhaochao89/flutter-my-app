import 'package:get/get.dart';
import 'package:my_app/GetX/getx_login.dart';
import 'package:my_app/GetX/getx_one.dart';
import 'package:my_app/GetX/getx_three.dart';
import 'package:my_app/GetX/getx_two.dart';
import 'package:my_app/GetX/increment.dart';
import 'package:my_app/GetX/middleware.dart';

class GetRoutes {
  static const loginPage = '/login';
  static const homePage = '/home';
  static const onePage = '/one';
  static const twoPage = '/two';
  static const threePage = '/three';
  static const notfound = '/notfound';

  static final pages = [
    GetPage(name: homePage, page: () => const InCrementPage()),
    GetPage(name: onePage, page: () => GetXOnePage()),
    GetPage(name: twoPage, page: () => GetXTwoPage()),
    GetPage(
        name: threePage,
        page: () => const GetXThreePage(),
        middlewares: [Middleware()]),
    GetPage(
        name: loginPage,
        page: () => const GetxLoginPage(),
        transition: Transition.downToUp,
        fullscreenDialog: true), // 设置fullscreenDialog为true可以解决跳转动画问题。
  ];
}
