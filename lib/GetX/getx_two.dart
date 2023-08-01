import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/GetX/getx_controller.dart';
import 'package:my_app/GetX/getx_three.dart';
import 'package:my_app/GetX/increment.dart';

class GetXTwoPage extends StatelessWidget {
  GetXTwoPage({super.key});

  final RxString _result = ''.obs;

  @override
  Widget build(BuildContext context) {
    //Controller这样创建，数据是全局共享的，类似单例一样，多次创建不影响之前设置的值。
    final Controller c = Get.put(Controller());

    final parameters = Get.parameters;
    String? device = '';
    String? name = '';
    if (parameters.isNotEmpty) {
      device = parameters['device'];
      name = parameters['name'];
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Two'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Get.arguments ?? '-', style: const TextStyle(fontSize: 20)),
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
                  Get.back();
                },
                child: const Text('返回上一页')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.offAll(const InCrementPage());
                },
                child: const Text('返回首页')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // 进入下一个界面，并取消之前所有的路由
                  Get.offAll(const GetXThreePage());
                },
                child: const Text('下一页并取消之前所有路由')),
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
                  c.token.value = 'token';
                  Get.toNamed('/three');
                },
                child: const Text('下一页有name参数')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  c.token.value = '';
                  Get.toNamed('/three');
                },
                child: const Text('下一页无name参数')),
          ],
        ),
      ),
    );
  }
}
