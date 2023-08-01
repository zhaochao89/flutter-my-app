import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/GetX/getx_controller.dart';

class Middleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    debugPrint('====$route====');
    final Controller c = Get.find();
    debugPrint('====${c.token}====');
    if (c.token.isEmpty) {
      //重新定位到其他页面
      return const RouteSettings(name: '/login');
    }
    return super.redirect(route);
  }
}
