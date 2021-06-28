import 'package:get/get.dart';

class Validator {
  Validator._();

  static String? email(String? value) {
    const String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'validator.email'.tr;
    else
      return null;
  }

  static String? password(String? value) {
    const String pattern = r'^.{6,}$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'validator.password'.tr;
    else
      return null;
  }

  static String? name(String? value) {
    const String pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'validator.name'.tr;
    else
      return null;
  }

  static String? number(String? value) {
    const String pattern = r'^\D?(\d{3})\D?\D?(\d{3})\D?(\d{4})$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'validator.number'.tr;
    else
      return null;
  }

  static String? amount(String? value) {
    const String pattern = r'^\d+$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'validator.amount'.tr;
    else
      return null;
  }

  static String? notEmpty(String? value) {
    const String pattern = r'^\S+$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!))
      return 'validator.notEmpty'.tr;
    else
      return null;
  }
}
