import 'package:flutter/material.dart';
import 'package:islamyroute/views/tabs%20details/hadeth_details/hadeth_details.dart';
import 'package:islamyroute/views/tabs%20details/sura_details/sura_details.dart';

import 'views/HomeScreen.dart';
import 'views/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => const SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetails.routeName: (_) => const SuraDetails(),
        HadethDetails.routeName: (_) => const HadethDetails()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
