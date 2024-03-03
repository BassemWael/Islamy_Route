import 'package:flutter/material.dart';
import 'package:islamyroute/utils/app_theme.dart';
import 'package:islamyroute/utils/build_context_extension.dart';
import 'package:islamyroute/views/provider/locale_provider.dart';
import 'package:islamyroute/views/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String selectedLanguage = "en";
  late LanguageProvider languageProvider;
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.l10n.localeName,
            style: themeProvider.mediumTitleTextStyle,
          ),
          const SizedBox(
            height: 12,
          ),
          buildLanguageDropDownMenu(),
          const SizedBox(
            height: 8,
          ),
          buildThemeSwitchRow()
        ],
      ),
    );
  }

  buildLanguageDropDownMenu() {
    return Row(
      children: [
        Expanded(
          child: DropdownButton<String>(
            elevation: 0,
            value: selectedLanguage,
            items: const [
              DropdownMenuItem(
                value: "en",
                child: Text("English"),
              ),
              DropdownMenuItem(
                value: "ar",
                child: Text(
                  "العربيه",
                ),
              )
            ],
            isExpanded: true,
            onChanged: (newValue) {
              selectedLanguage = newValue!;
              languageProvider.setNewLocale(selectedLanguage);
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  Widget buildThemeSwitchRow() {
    return Row(
      children: [
        const Text(
          "Dark Theme",
          style: AppTheme.regularTitleTextStyle,
        ),
        const Spacer(),
        Switch(
            value: themeProvider.currentThemeMode == ThemeMode.dark,
            onChanged: (newValue) {
              themeProvider.toggleTheme(newValue);
            })
      ],
    );
  }
}
