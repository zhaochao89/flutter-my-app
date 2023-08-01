import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxLoginPage extends StatefulWidget {
  const GetxLoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _GetxLoginPageState();
}

class _GetxLoginPageState extends State<GetxLoginPage> {
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
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
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
          Row(
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
          )
        ],
      ),
    );
  }
}
