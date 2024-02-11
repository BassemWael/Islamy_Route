import 'package:flutter/material.dart';
import 'package:islamyroute/utils/app_assets.dart';
import 'dart:math' as math;

import 'package:islamyroute/utils/app_colors.dart';
import 'package:islamyroute/utils/app_theme.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double _rotationAngle = 0.0;
  int counter = 0;
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
          SizedBox(
            height: 40,
          ),
          Text(
            "عدد التسبيحات",
            style: AppTheme.mediumTitleTextStyle,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            color: AppColors.orange,
            width: 80,
            height: 50,
            child: Center(
              child: Text(
                counter.toString(),
                style: AppTheme.regularTitleTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
