import 'package:flutter/material.dart';
import 'package:mindwatch/intl/app_strings.dart';
import 'package:mindwatch/utils/app_assets.dart';
import 'package:mindwatch/utils/app_colors.dart';
import 'package:mindwatch/utils/app_description_card.dart';
import 'package:mindwatch/utils/app_routes.dart';
import 'package:mindwatch/utils/app_theme.dart';
import 'package:mindwatch/views/widgets/app_scaffold.dart';

class SignInActivity1 extends StatelessWidget {
  const SignInActivity1({Key key, this.age}) : super(key: key);

  final String age;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Image.asset(
                  AppAssets.appLogo,
                  fit: BoxFit.fitWidth,
                ),
              ),
              DescriptionCard(
                descriptionText: AppStrings.of(context).activity1Description,
                descriptionStyle: appTheme.textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
              DescriptionCard(
                descriptionText: AppStrings.of(context).question1,
                descriptionStyle: appTheme.textTheme.headline1,
                textAlign: TextAlign.center,
                padding: const EdgeInsets.all(2.0),
              ),
              MaterialButton(
                onPressed: () => _onButtonTapHandler(
                  1,
                  context,
                  AppStrings.of(context).question1answerOption1,
                ),
                color: AppColors.primaryColor,
                minWidth: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(96, 96),
                  ),
                ),
                child: Text(
                  AppStrings.of(context).question1answerOption1,
                  style: appTheme.textTheme.subtitle2.copyWith(
                    color: AppColors.appWhite,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () => _onButtonTapHandler(
                  2,
                  context,
                  AppStrings.of(context).question1answerOption2,
                ),
                color: AppColors.primaryColor,
                minWidth: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(96, 96),
                  ),
                ),
                child: Text(
                  AppStrings.of(context).question1answerOption2,
                  style: appTheme.textTheme.subtitle2.copyWith(
                    color: AppColors.appWhite,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
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

  void _onButtonTapHandler(int value, BuildContext context, String gender) {
    print(AppRoutes.signInActivity2.path);
    Navigator.of(context).pushNamed(
      AppRoutes.signInActivity2.path,
      arguments: <String, String>{
        'gender': gender,
        'age': age,
      },
    );
  }
}
