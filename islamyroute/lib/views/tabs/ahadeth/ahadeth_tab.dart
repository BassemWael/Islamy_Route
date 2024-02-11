import 'package:flutter/material.dart';
import 'package:islamyroute/model/sura_details_args.dart';
import 'package:islamyroute/views/tabs%20details/hadeth_details/hadeth_details.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_theme.dart';

class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3, child: Center(child: Image.asset(AppAssets.quranTabLogo))),
        Expanded(
          flex: 7,
          child: buildTabContent(),
        )
      ],
    );
  }

  Widget buildTabContent() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 3,
          color: AppColors.orange,
        ),
        const SizedBox(
          height: 4,
        ),
        const Row(
          children: [
            Expanded(
                child: Text(
              "اسم الحديث",
              textAlign: TextAlign.center,
              style: AppTheme.mediumTitleTextStyle,
            )),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          width: double.infinity,
          height: 3,
          color: AppColors.orange,
        ),
        Expanded(
          flex: 7,
          child: buildListView(),
        ),
      ],
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        String hadethName = "الجديث رقم ${index + 1}";
        return InkWell(
          onTap: () {
            String fileName = "h${index + 1}.txt";
            Navigator.pushNamed(context, HadethDetails.routeName,
                arguments: DetailsScreenArgs(
                    fileName: fileName, suraName: hadethName));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Text("الجديث رقم ${index + 1}",
                      textAlign: TextAlign.center,
                      style: AppTheme.regularTitleTextStyle)),
            ],
          ),
        );
      },
    );
  }
}
