import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/GetX/get_routes.dart';
import 'package:my_app/GetX/getx_three.dart';
import 'package:my_app/GetX/increment.dart';

class GetXTwoPage extends StatelessWidget {
  GetXTwoPage({super.key});

  final RxString _result = ''.obs;

  @override
  Widget build(BuildContext context) {
    // parameters 如果使用toNamed跳转页面并设置parameters后，再用to去跳转同一个页面，Get.parameters能获取到toNamed传递的parameters。
    final parameters = Get.parameters;
    String? device = '';
    String? name = '';
    if (parameters.isNotEmpty) {
      device = parameters['device'];
      name = parameters['name'];
    }
    // arguments
    final arguments = Get.arguments as Map<String, String>?;
    String? content;
    if (arguments?.isNotEmpty == true) {
      content = arguments?['content'];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Two'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(content ?? '-', style: const TextStyle(fontSize: 20)),
            const SizedBox(
              height: 20,
            ),
            parameters.isNotEmpty
                ? Text(device! + name!, style: const TextStyle(fontSize: 20))
                : Container(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.offAll(const InCrementPage(),
                      transition: Transition.noTransition); //设置没有动画
                },
                child: const Text('返回首页(offAll)')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // 进入下一个界面，并取消之前所有的路由
                  Get.offAll(const GetXThreePage());
                },
                child: const Text('下一页(offAll)并取消之前所有路由')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // 进入下一个界面，并取消之前所有的路由
                  Get.offAllNamed(GetRoutes.threePage);
                },
                child: const Text('下一页(offAllNamed)并取消之前所有路由')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  //接受返回的数据
                  var result = await Get.to(const GetXThreePage());
                  _result.value = result;
                },
                child:
                    Obx(() => Text('跳转到PageThree页面，这是返回的值${_result.value}'))),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(GetRoutes.threePage);
                },
                child: const Text('下一页(Get.toNamed)')),
          ],
        ),
      ),
    );
  }
}
