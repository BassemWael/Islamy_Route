import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_theme.dart';
import 'tabs/ahadeth/ahadeth_tab.dart';
import 'tabs/quran/quran_tab.dart';
import 'tabs/radio/radio_tab.dart';
import 'tabs/sebha/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    const QuranTab(),
    const AhadethTab(),
    const SebhaTab(),
    const RadioTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppAssets.background,
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomNav(),
        body: tabs[currentTabIndex],
      ),
    );
  }

  AppBar buildAppBar() => AppBar(
        title: const Text(
          "Islami",
          style: AppTheme.appBarTextStyle,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.transparent,
      );

  Widget buildBottomNav() => Theme(
        data: ThemeData(canvasColor: AppColors.orange),
        child: BottomNavigationBar(
          items: [
            buildBottomNavigationBarItem(AppAssets.icQuran, "quran"),
            buildBottomNavigationBarItem(AppAssets.icAhadeth, "ahadeth"),
            buildBottomNavigationBarItem(AppAssets.icSebha, "sebha"),
            buildBottomNavigationBarItem(AppAssets.icRadio, "radio"),
          ],
          selectedItemColor: AppColors.lightBlack,
          iconSize: 34,
          currentIndex: currentTabIndex,
          onTap: (index) {
            currentTabIndex = index;
            setState(() {});
          },
        ),
      );

  BottomNavigationBarItem buildBottomNavigationBarItem(
          String iconPath, String label) =>
      BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(iconPath)), label: label);
}
