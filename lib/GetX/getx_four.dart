import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeP extends GetConnect {}

class GetXFourPage extends StatelessWidget {
  const GetXFourPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Four'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.showSnackbar(const GetSnackBar(
                    title: '这是title',
                    message: '这是message',
                    snackPosition: SnackPosition.TOP,
                  ));
                },
                child: const Text('show snackbars')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: const Text('show dialogs')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text('show bottomsheets')),
          ],
        ),
      ),
    );
  }
}
