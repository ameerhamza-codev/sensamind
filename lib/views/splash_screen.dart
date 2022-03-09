import 'package:flutter/material.dart';
import 'package:mindwatch/intl/app_strings.dart';
import 'package:mindwatch/utils/app_assets.dart';
import 'package:mindwatch/utils/app_description_card.dart';
import 'package:mindwatch/views/widgets/app_scaffold.dart';
import 'package:mindwatch/views/widgets/scaffold_bg.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      scaffoldBackground: ScaffoldBg(
        asset: AppAssets.bg(2),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.5,
                child: Image.asset(
                  AppAssets.appLogo,
                  fit: BoxFit.fitWidth,
                ),
              ),
              DescriptionCard(
                descriptionText: AppStrings.of(context).betaGroup,
                descriptionStyle: Theme.of(context).textTheme.headline4,
                // child: Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                //   child: Text(
                //     AppStrings.of(context).betaGroup,
                //     style: appTheme.textTheme.title.copyWith(
                //       color: AppColors.primaryColor,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
              ),
              CircularProgressIndicator(),
              AspectRatio(
                aspectRatio: 1.5,
                child: Image.asset(
                  AppAssets.splashScreen,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ].map((Widget child) {
              if (child is Image || child is Expanded) {
                return child;
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: child,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
