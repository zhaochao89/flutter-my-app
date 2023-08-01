import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/GetX/getx_controller.dart';

class GetxLoginPage extends StatefulWidget {
  const GetxLoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _GetxLoginPageState();
}

class _GetxLoginPageState extends State<GetxLoginPage> {
  //Controller这样创建，数据是全局共享的，类似单例一样，多次创建不影响之前设置的值。
  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('登录'),
        leading: const Text(''),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 300,
                  height: 52,
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.person), hintText: '用户名'),
                  )),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 300,
                  height: 52,
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.password), hintText: '密码'),
                  ))
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(
              onPressed: () {
                c.token.value = 'token';
                Get.back();
              },
              child: const Text('登录')),
        ],
      ),
    );
  }
}
