import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  BaseController(this.context);
  BuildContext context;

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  Future<void> onClose() async {
    dispose();
    super.onClose();
  }
}
