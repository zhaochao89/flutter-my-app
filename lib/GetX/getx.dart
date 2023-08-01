import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/GetX/get_routes.dart';
import 'package:my_app/GetX/getx_controller.dart';
import 'package:my_app/GetX/notfound.dart';

class GetXMainPage extends StatelessWidget {
  const GetXMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Controller这样创建，数据是全局共享的，类似单例一样，其他地方使用是用Get.find()
    Get.put(Controller());
    return GetMaterialApp(
        title: "GetX",
        unknownRoute: GetPage(
            name: '/notfound',
            page: () {
              debugPrint('===NotFoundPage===');
              return const NotFoundPage();
            }),
        initialRoute: '/home', //initialRoute不能使用’/‘作为路由，否则unknownRoute会不生效。
        //监听路由变化
        // routingCallback: (value) {
        //   debugPrint('===${value!.current}===');
        //   debugPrint('===${value.previous}===');
        // },
        getPages: GetRoutes.pages);
  }
}
