import 'package:projectname_flutter_mobile/infrastructure/models/menu_option_model.dart';

class Globals {
  Globals._();
  static const String defaultLanguage = 'ja';

  static final List<MenuOptionsModel> languageOptions = [
    MenuOptionsModel(key: 'en', value: 'English'), //English
    MenuOptionsModel(key: 'ja', value: '日本語'), //Japanese
  ];
}
