import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/GetX/getx_one.dart';
import 'getx_controller.dart';
import 'getx_two.dart';

class InCrementPage extends StatelessWidget {
  const InCrementPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('=====InCrementPage build=====');
    final Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
          title: Obx(
        () => Text('Clicks: ${c.count}'), // 使用GetX修改状态的组件需要使用Obx来创建
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => GetXOnePage()));
                  //使用Getx管理路由时，需要将MaterialAp替换成GetMaterialApp
                  Get.to(GetXOnePage());
                },
                child: const Text('下一页')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  //跳转到下一个页面时，会将上一个页面移除，不能返回上一个页面，多用于启动页和登录页面
                  Get.off(GetXTwoPage());
                },
                child: const Text('跳转下一个页面，下一个页面没有返回')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/one');
                },
                child: const Text('Get toNamed')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/four');
                },
                child: const Text('Get toNamed not found')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          c.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
