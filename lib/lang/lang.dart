import 'package:flutter/cupertino.dart';

class AppLang extends ChangeNotifier {
  Locale selectedLang = const Locale('ar');

  toggleLang() {
    if (selectedLang == const Locale('ar')) {
      selectedLang = const Locale('en');
    } else {
      selectedLang = const Locale('ar');
    }
    notifyListeners();
  }
}
