// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:projectname_flutter_mobile/enums/gender.dart';
import 'package:projectname_flutter_mobile/infrastructure/models/user.dart';

void main() {
  test('User data should be equal - toString()', () {
    // ARRANGE
    final DateTime now = DateTime.now();
    final User user = User(
        firstName: 'John',
        lastName: 'Doe',
        email: 'john.doe@gmail.com',
        gender: Gender.male,
        birthday: now);
    final User jsonUser = User.fromJson(<String, dynamic>{
      'first_name': 'John',
      'last_name': 'Doe',
      'email': 'john.doe@gmail.com',
      'gender': 'male',
      'birthday': now.toString()
    });

    // ACT

    // ASSERT
    expect(user.toString(), jsonUser.toString());
  });

  test('User data should be equal - tojson()', () {
    // ARRANGE
    final DateTime now = DateTime.now();
    final User user = User(
        firstName: 'John',
        lastName: 'Doe',
        email: 'john.doe@gmail.com',
        gender: Gender.male,
        birthday: now);
    final User jsonUser = User.fromJson(<String, dynamic>{
      'first_name': 'John',
      'last_name': 'Doe',
      'email': 'john.doe@gmail.com',
      'gender': 'male',
      'birthday': now.toString()
    });

    // ACT

    // ASSERT
    expect(user.toJson(), jsonUser.toJson());
  });

  test('User class assertion should fail due to different memory allocation',
      () {
    // ARRANGE
    final DateTime now = DateTime.now();
    final User user = User(
        firstName: 'John',
        lastName: 'Doe',
        email: 'john.doe@gmail.com',
        gender: Gender.male,
        birthday: now);
    final User jsonUser = User.fromJson(<String, dynamic>{
      'first_name': 'John',
      'last_name': 'Doe',
      'email': 'john.doe@gmail.com',
      'gender': 'male',
      'birthday': now.toString()
    });

    // ACT

    // ASSERT
    expect(() {
      assert(user == jsonUser);
    }, throwsA(isA<AssertionError>()));
  });

  test('User from JSON should fail when null', () {
    // ARRANGE
    final DateTime now = DateTime.now();
    final User user = User(
        firstName: 'John',
        lastName: 'Doe',
        email: 'john.doe@gmail.com',
        gender: Gender.male,
        birthday: now);
    final User jsonUser = User.fromJson(null);

    // ACT

    // ASSERT
    expect(() {
      assert(user.toJson() == jsonUser.toJson());
      assert(user.toString() == jsonUser.toString());
      assert(user == jsonUser);
    }, throwsA(isA<AssertionError>()));
  });
}
