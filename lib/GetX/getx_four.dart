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
                    duration: Duration(seconds: 3),
                  ));
                },
                child: const Text('show snackbars')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // Get.defaultDialog();
                  Get.dialog(Center(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        width: 300,
                        // height: 150,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                              '这是标题',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  decoration: TextDecoration.none),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            const Text(
                              '这是内容',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  decoration: TextDecoration.none),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text('确定')),
                                ),
                                const SizedBox(
                                  width: 32,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.white)),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text(
                                        '取消',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        )),
                  ));
                },
                child: const Text('show dialogs')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(
                    SafeArea(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                              leading: const Icon(Icons.music_note),
                              title: const Text('Music'),
                              onTap: () {}),
                          const Divider(),
                          ListTile(
                            leading: const Icon(Icons.videocam),
                            title: const Text('Video'),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8))),
                  );
                },
                child: const Text('show bottomsheets')),
          ],
        ),
      ),
    );
  }
}
