import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:projectname_flutter_mobile/controllers/sign_in_controller.dart';
import 'package:projectname_flutter_mobile/helpers/validator.dart';
import 'package:projectname_flutter_mobile/presentation/widgets/form_input_field_with_icon.dart';

import '../blank_screen.dart';

class SignInScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => GetBuilder<SignInController>(
        init: SignInController(context),
        builder: (SignInController controller) {
          return Scaffold(
            body: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(height: 48.0),
                        FormInputFieldWithIcon(
                          controller: controller.emailController,
                          iconPrefix: Icons.email,
                          labelText: 'auth.emailFormField'.tr,
                          validator: Validator.email,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: controller.emailOnChange,
                        ),
                        const SizedBox(height: 24),
                        FormInputFieldWithIcon(
                          controller: controller.passwordController,
                          iconPrefix: Icons.lock,
                          labelText: 'auth.passwordFormField'.tr,
                          validator: Validator.password,
                          obscureText: true,
                          onChanged: controller.passwordOnChange,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                            child: Text('auth.signInButton'.tr),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                controller
                                    .signInWithEmailAndPassword();
                              }
                            }),
                        const SizedBox(height: 24),
                        TextButton(
                          child: Text(
                            'auth.resetPasswordLabelButton'.tr,
                          ),
                          onPressed: () => Get.to(
                            BlankScreen(),
                          ),
                        ),
                        TextButton(
                          child: Text(
                            'auth.signUpLabelButton'.tr,
                          ),
                          onPressed: () => Get.to(
                            BlankScreen(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
}
