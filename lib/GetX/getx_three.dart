import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/GetX/get_routes.dart';
import 'package:my_app/GetX/getx_four.dart';
import 'package:my_app/GetX/page_three_controller.dart';

class GetXThreePage extends StatelessWidget {
  const GetXThreePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageThreeController c = Get.put(PageThreeController('12233'));
    return WillPopScope(
      onWillPop: () async {
        Get.back(result: 'PageThress返回的');
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GetX Three'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.back(result: 'PageThress返回的');
                  },
                  child: const Text('返回上一页')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(const GetXFourPage());
                  },
                  child: const Text('下一页')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(GetRoutes.homePage);
                  },
                  child: const Text('返回首页(offAllNamed)')),
            ],
          ),
        ),
      ),
    );
  }
}
