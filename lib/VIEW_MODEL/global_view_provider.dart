import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';

class GlobalViewProvider extends ChangeNotifier {
  String current_lang;

  setlang(BuildContext context) {
    print(context.locale.toString());
  }

  notify() {
    notifyListeners();
  }

  changeLanguage(BuildContext context, String lang) {
    if (lang == 'en') {
      current_lang = 'en';
      context.locale = Locale('en');
      notifyListeners();
    } else {
      current_lang = 'ar';
      context.locale = Locale('ar');
      notifyListeners();
    }
  }

  switchLanguage(BuildContext context) {
    if (current_lang == 'en') {
      current_lang = 'ar';
      context.locale = Locale('ar');
      notifyListeners();
    } else {
      current_lang = 'en';
      context.locale = Locale('en');
      notifyListeners();
    }
  }

  setLanguage(String lang) {
    if (lang == 'en') {
      current_lang = 'en';
      notifyListeners();
    } else {
      current_lang = 'ar';
      notifyListeners();
    }
  }
}
