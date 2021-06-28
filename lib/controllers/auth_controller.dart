import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:projectname_flutter_mobile/enums/gender.dart';
import 'package:projectname_flutter_mobile/infrastructure/models/user.dart';
import 'package:projectname_flutter_mobile/presentation/screens/auth/sign_in_screen.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
  final RxBool isLoggedIn = false.obs;
  final bool isWithDataUser = true;

  late String _jwt;

  String get jwt => _jwt;

  @override
  Future<void> onReady() async {
    //run every time auth state changes

    super.onReady();
  }

  @override
  Future<void> onClose() async {
    isLoggedIn.close();
    super.onClose();
  }

  Future<void> handleAuthChanged(user) async {
    if (user != null) {
    }

    if (isLoggedIn.value) {
      Get.offAll(SignInScreen());
    } else {
      // Get.offAll(HomeScreen());
    }
  }

  //Method to handle user sign in using email and password
  Future<void> signInWithEmailAndPassword(String email, String pass) async {
    try {
      _jwt = 'jwt';
    } catch (error) {
      Get.snackbar('auth.signInErrorTitle'.tr, 'auth.signInError'.tr,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  // User registration using email and password
  Future<void> registerWithEmailAndPassword() async {
    try {
    } catch (error) {
      Get.snackbar('auth.signUpErrorTitle'.tr, 'Error message',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  Future<void> updateUser(User user, String oldEmail,
      String password) async {
    try {
      Get.snackbar('auth.updateUserSuccessNoticeTitle'.tr,
          'auth.updateUserSuccessNotice'.tr,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    } on PlatformException catch (error) {
      print(error.code);
      String authError;
      switch (error.code) {
        case 'ERROR_WRONG_PASSWORD':
          authError = 'auth.wrongPasswordNotice'.tr;
          break;
        default:
          authError = 'auth.unknownError'.tr;
          break;
      }
      Get.snackbar('auth.wrongPasswordNoticeTitle'.tr, authError,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  Future<void> sendResetPassword() async {
    try {
      Get.snackbar(
          'auth.resetPasswordNoticeTitle'.tr, 'auth.resetPasswordNotice'.tr,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    } catch (error) {
      Get.snackbar('auth.resetPasswordFailed'.tr, 'Error Message',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  Future<User> getUser() async {
    return User(firstName: '', lastName: '', email: '', birthday: DateTime.now(), gender: Gender.undefined);
  }

  Future<void> signOut() async {

  }
}
