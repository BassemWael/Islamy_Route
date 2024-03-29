import 'package:flutter/material.dart';

import '../../../model/sura_details_args.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/constants.dart';
import '../../tabs details/sura_details/sura_details.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3, child: Center(child: Image.asset(AppAssets.quranTabLogo))),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              buildTabContent(),
              Container(
                width: 3,
                color: AppColors.orange,
                height: double.infinity,
              )
            ],
          ),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Text(
              "Sura Name",
              textAlign: TextAlign.center,
              style: AppTheme.mediumTitleTextStyle,
            )),
            Expanded(
                child: Text("Verses",
                    textAlign: TextAlign.center,
                    style: AppTheme.mediumTitleTextStyle)),
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
      itemCount: Constants.suraNames.length,
      itemBuilder: (context, index) {
        String suraName = Constants.suraNames[index];
        return InkWell(
          onTap: () {
            String fileName = "${index + 1}.txt";
            Navigator.pushNamed(context, SuraDetails.routeName,
                arguments:
                    DetailsScreenArgs(fileName: fileName, suraName: suraName));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Text(
                suraName,
                textAlign: TextAlign.center,
                style: AppTheme.regularTitleTextStyle,
              )),
              Expanded(
                  child: Text("${Constants.versesNumber[index]}",
                      textAlign: TextAlign.center,
                      style: AppTheme.regularTitleTextStyle)),
            ],
          ),
        );
      },
    );
  }
}
