import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageThreeController extends GetxController {
  PageThreeController(this.id);
  String id;

  @override
  void onInit() {
    super.onInit();
    fetchData(id);
  }

  void fetchData(String id) {
    debugPrint('====id：$id====');
  }
}
