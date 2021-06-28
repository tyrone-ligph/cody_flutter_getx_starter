import 'dart:io';

import 'package:flutter/services.dart';

// Please change class name specified for the feature/function
class FeatureNameChannel {

  /// Instantiate and get instance
  ///
  ///
  factory FeatureNameChannel() => _instance ??= FeatureNameChannel._();
  FeatureNameChannel._();
  static FeatureNameChannel? _instance;

  static const String _CHANNEL = 'com.sample.projectname/featurename';

  // TO native actions.
  static const String _ACTION = 'ACTION';

  final MethodChannel _platform = const MethodChannel(_CHANNEL);

  Future<int> featureSample() async {
    if (Platform.isAndroid) {
    }
    if (Platform.isIOS) {
    }

    int result;
    try {
      result = await _platform.invokeMethod(_ACTION);
    } on PlatformException {
      result = 0;
    }
    return result;
  }
}
