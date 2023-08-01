import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/GetX/get_routes.dart';
import 'package:my_app/GetX/notfound.dart';

class GetXMainPage extends StatelessWidget {
  const GetXMainPage({super.key});

  @override
  Widget build(BuildContext context) {
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
