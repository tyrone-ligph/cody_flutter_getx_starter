import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';
import 'base_controller.dart';

class SignInController extends BaseController {
  SignInController(BuildContext context) : super(context);

  static final AuthController _authController = Get.find();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Future<void> onReady() async {
    //run every time auth state changes
    print('onReady');
    super.onReady();
  }

  @override
  Future<void> onClose() async {
    emailController.dispose();
    passwordController.dispose();
    dispose();
    super.onClose();

  }

  void emailOnChange(String value) {

  }

  void passwordOnChange(String value) {

  }

  void signInWithEmailAndPassword() {
    _authController.signInWithEmailAndPassword(emailController.text, passwordController.text);
  }
}