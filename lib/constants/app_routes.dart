import 'package:get/get.dart';
import 'package:projectname_flutter_mobile/presentation/screens/auth/sign_in_screen.dart';
import 'package:projectname_flutter_mobile/presentation/screens/splash_screen.dart';

/// Register your Screens here with routes
///
///
class AppRoutes {
  AppRoutes._();
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<dynamic>(name: '/', page: () => SplashScreen()),
    GetPage<dynamic>(name: '/signin', page: () => SignInScreen()),
    // GetPage<dynamic>(name: '/signup', page: () => SignUpScreen()),
    // GetPage<dynamic>(name: '/home', page: () => HomeScreen()),
  ];
}
