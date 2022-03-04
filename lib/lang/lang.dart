import 'package:flutter/cupertino.dart';

class AppLang extends ChangeNotifier {
  Locale selectedLang = Locale('ar');

  toggleLang() {
    if (selectedLang == Locale('ar')) {
      selectedLang = Locale('en');
    } else {
      selectedLang = Locale('ar');
    }
    notifyListeners();
  }
}
