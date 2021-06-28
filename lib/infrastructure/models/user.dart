import 'package:projectname_flutter_mobile/enums/gender.dart';
import 'package:projectname_flutter_mobile/infrastructure/models/base_model.dart';

class User extends BaseModel {
  User({
    this.firstName,
    this.lastName,
    this.birthday,
    this.gender,
    this.email,
  }) : super.fromJson();

  User.fromJson(Map<String, dynamic>? json) : super.fromJson() {
    if (json == null) {
      return;
    }

    firstName = json['first_name'];
    lastName = json['last_name'];
    birthday = DateTime.parse(json['birthday']);
    gender = genderFromString(json['gender']);
    email = json['email'];
  }

  String? firstName;
  String? lastName;
  DateTime? birthday;
  Gender? gender;
  String? email;

  int? get age => getAge(birthday);

  @override
  Map<String, dynamic> toJson() {
    assert(firstName != null);
    assert(lastName != null);
    assert(birthday != null);
    assert(gender != null);
    return <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'birth_date': birthday.toString(),
      'gender': gender!.convertToString,
    };
  }

  @override
  String getValue() {
    return '$firstName $lastName';
  }

  @override
  void setValue(dynamic value) {}

  @override
  String toString() {
    return '''User{ firstName: $firstName, lastName: $lastName, birthday: $birthday, gender: $gender }''';
  }
}

int? getAge(DateTime? birthdate) {
  if (birthdate == null) {
    return null;
  }
  final DateTime now = DateTime.now();
  int leapYearDays = 0;

  for (int i = birthdate.year; i <= now.year; i++) {
    bool isLeapYear = false;

    if (i % 4 == 0) {
      isLeapYear = true;
    }
    if (i % 100 == 0) {
      isLeapYear = false;
    }
    if (i % 400 == 0) {
      isLeapYear = true;
    }
    if (isLeapYear) {
      leapYearDays++;
    }
  }

  return ((now.difference(birthdate).inDays - leapYearDays) / 365).floor();
}
