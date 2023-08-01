import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/GetX/get_routes.dart';
import 'package:my_app/GetX/getx_controller.dart';
import 'package:my_app/GetX/getx_two.dart';

///使用Getx来进行状态管理时组件可以使用StatelessWidget，
///有两点需要注意：1、状态变量需要使用.obs结尾；2、需要更改状态的组件需要使用Obx()来创建。

class GetXOnePage extends StatelessWidget {
  GetXOnePage({super.key});
  final RxInt _count = 0.obs;
  final Controller _c = Get.find();

  @override
  Widget build(BuildContext context) {
    debugPrint('===GetXOnePage build===');
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX One'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 使用GetX修改状态的组件需要使用Obx来创建
            Obx(() => Text(
                  '当前页面修改的值：$_count',
                  style: const TextStyle(fontSize: 20),
                )),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Text('这是上个页面Controller里面改变的count: ${_c.count}'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('上一页(Get.back)')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(GetXTwoPage(),
                      arguments: {'content': '这是pageOne toNamed带的参数'});
                },
                child: const Text('下一页(Get.to)带参数')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // 这种传参在下个页面用Get.parameters接收，但是这个是全局的，其他页面也能得到这个参数
                  Get.toNamed('/two?device=phone&name=zhao');
                },
                child: const Text('下一页动态网页链接传参')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(GetRoutes.twoPage);
                },
                child: const Text('下一页(Get.toNamed)')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(GetRoutes.twoPage,
                      arguments: {'content': '这是pageOne toNamed带的参数'},
                      parameters: {'device': 'phone', 'name': 'zhao'});
                },
                child: const Text('下一页(Get.toNamed)带参数')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _count.value++;
          _c.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
