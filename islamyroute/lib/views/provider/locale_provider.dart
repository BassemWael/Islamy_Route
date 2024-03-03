import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLocale = "en";

  void setNewLocale(String newLocale) {
    currentLocale = newLocale;
    notifyListeners();
  }
}
