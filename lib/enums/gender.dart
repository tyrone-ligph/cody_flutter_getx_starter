import 'package:get/get.dart';

enum Gender {
  male,
  female,
  undefined,
}

Gender genderFromString(String? gender) {
  if (gender == null) {
    return Gender.undefined;
  }

  if (gender == '男性' || gender.toLowerCase() == 'male') {
    return Gender.male;
  } else if (gender == '女性' || gender.toLowerCase() == 'female') {
    return Gender.female;
  } else {
    return Gender.undefined;
  }
}

extension GenderConversion on Gender {
  String get convertToString {
    switch (this) {
      case Gender.female:
        return 'gender.female'.tr;
      case Gender.male:
        return 'gender.male'.tr;
      default:
        return 'gender.undefined'.tr;
    }
  }
}