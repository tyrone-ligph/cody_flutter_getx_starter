import 'dart:convert';

import 'package:flutter/services.dart';

import 'dart_defines.dart';

class Env {

  Env._();

  static Map<String, dynamic>? _env;
  static String? _flavor;

  static Future<void> init() async {
    _env = json.decode(await rootBundle.loadString('.env'));
    _flavor = DartDefines.flavor;
  }

  /// Get API Url.
  ///
  ///
  static String get apiUrl => _env![_flavor]['apiUrl'];

  /// Get API Url.
  ///
  ///
  static String get appName => _env![_flavor]['appName'];
}
