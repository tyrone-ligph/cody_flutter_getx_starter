import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projectname_flutter_mobile/environment.dart';

import 'constants/app_routes.dart';
import 'controllers/auth_controller.dart';
import 'controllers/language_controller.dart';
import 'helpers/localization.dart';
import 'presentation/widgets/loading.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.init();
  await GetStorage.init();
  Get.put<AuthController>(AuthController());
  Get.put<LanguageController>(LanguageController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<LanguageController>(
        builder: (LanguageController languageController) => Loading(
          child: GetMaterialApp(
            translations: Localization(),
            locale: languageController.getLocale,
            // debugShowCheckedModeBanner: false,
            // defaultTransition: Transition.fade,
            themeMode: ThemeMode.system,
            initialRoute: '/',
            getPages: AppRoutes.routes,
          ),
        ),
      );
}
