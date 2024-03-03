import 'package:flutter/material.dart';
import 'package:islamyroute/utils/app_assets.dart';
import 'package:islamyroute/utils/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentThemeMode = ThemeMode.light;

  toggleTheme(bool darkThemeSwitchValue) {
    currentThemeMode = darkThemeSwitchValue ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  bool get isLightModeEnabled => currentThemeMode == ThemeMode.light;

  String get mainBackground =>
      isLightModeEnabled ? AppAssets.background : AppAssets.darkBackground;

  TextStyle get appBarTextStyle => isLightModeEnabled
      ? AppTheme.appBarTextStyle
      : AppTheme.appBarDarkTextStyle;

  TextStyle get mediumTitleTextStyle => isLightModeEnabled
      ? AppTheme.mediumTitleTextStyle
      : AppTheme.mediumTitleDarkTextStyle;

  TextStyle get regularTitleTextStyle => isLightModeEnabled
      ? AppTheme.regularTitleTextStyle
      : AppTheme.regularTitleDarkTextStyle;
}
