import 'package:flutter/material.dart';
import 'package:islamyroute/utils/app_assets.dart';
import 'dart:math' as math;
import 'package:islamyroute/utils/app_theme.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double _rotationAngle = 0.0;
  int counter = 0;
  String do3aa = "سبحان الله";
  int index = 0;
  void changeDo3aa() {
    List<String> ad3ya = ["سبحان الله", "الحمدلله", "الله اكبر"];
    index = index + 1;
    do3aa = ad3ya[index];
    if (index == 2) {
      index = -1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Stack(
            children: [
              const Row(
                children: [
                  SizedBox(
                    width: 180,
                  ),
                  Image(image: AssetImage(AppAssets.sebhaHead)),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: 82),
                    GestureDetector(
                      onTap: () {
                        if (counter % 33 == 0 && counter > 0) {
                          changeDo3aa();
                        }
                        setState(() {
                          _rotationAngle += 14.0;
                          counter++;
                        });
                      },
                      child: Transform.rotate(
                        angle: _rotationAngle * (math.pi / 180),
                        child:
                            const Image(image: AssetImage(AppAssets.sebhaBody)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "عدد التسبيحات",
            style: AppTheme.mediumTitleTextStyle,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color.fromARGB(255, 187, 161, 125)),
            width: 80,
            height: 50,
            child: Center(
              child: Text(
                counter.toString(),
                style: AppTheme.regularTitleTextStyle,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color.fromARGB(255, 164, 116, 48)),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      do3aa,
                      style: AppTheme.regularTitleTextStyle
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
