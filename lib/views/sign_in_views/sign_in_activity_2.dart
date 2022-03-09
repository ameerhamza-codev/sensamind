import 'package:flutter/material.dart';
import 'package:mindwatch/connectors/app_connector.dart';
import 'package:mindwatch/intl/app_strings.dart';
import 'package:mindwatch/utils/app_assets.dart';
import 'package:mindwatch/utils/app_colors.dart';
import 'package:mindwatch/utils/app_description_card.dart';
import 'package:mindwatch/utils/app_loader.dart';
import 'package:mindwatch/utils/app_routes.dart';
import 'package:mindwatch/utils/app_theme.dart';
import 'package:mindwatch/views/widgets/app_scaffold.dart';

class SignInActivity2 extends StatelessWidget {
  SignInActivity2({Key key, this.gender, this.age}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String gender;
  final String age;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            Image.asset(
              AppAssets.appLogo,
              fit: BoxFit.fitWidth,
            ),
            DescriptionCard(
              descriptionText: AppStrings.of(context).activity2Description,
              descriptionStyle: appTheme.textTheme.subtitle2,
            ),
            DescriptionCard(
              descriptionText: AppStrings.of(context).question2,
              descriptionStyle: appTheme.textTheme.headline,
              textAlign: TextAlign.center,
              padding: const EdgeInsets.all(2.0),
            ),
            AppConnector(
              condition:
                  (AppViewModel oldViewModel, AppViewModel newViewModel) {
                if (oldViewModel.isSetupCompleted !=
                    newViewModel.isSetupCompleted)
                  Navigator.of(context).pushNamed(
                    AppRoutes.activityCompleted.path,
                  );
                else if (newViewModel.exceptionMessage != null) {
                  _scaffoldKey.currentState.showSnackBar(
                      SnackBar(content: Text(newViewModel.exceptionMessage)));
                }
                return true;
              },
              builder: (BuildContext context, AppViewModel model) {
                if (model.isLoading) {
                  return AppLoader();
                }
                return Column(
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        String set;
                        if (gender ==
                            AppStrings.of(context).question1answerOption1)
                          set = '2';
                        else
                          set = '3';
                        model.activitySubmit(
                          gender: gender.toLowerCase() == 'male' ? 0 : 1,
                          age: age,
                          argued: AppStrings.of(context).question2answerOption1,
                          set: set,
                        );
                      },
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
                        AppStrings.of(context).question2answerOption1,
                        style: appTheme.textTheme.subtitle2.copyWith(
                          color: AppColors.appWhite,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        String set;
                        if (gender ==
                            AppStrings.of(context).question1answerOption1)
                          set = '3';
                        else
                          set = '4';
                        model.activitySubmit(
                          gender: gender?.toLowerCase() == 'male' ? 0 : 1,
                          age: age,
                          argued: AppStrings.of(context).question2answerOption1,
                          set: set,
                        );
                      },
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
                        AppStrings.of(context).question2answerOption2,
                        style: appTheme.textTheme.subtitle2.copyWith(
                          color: AppColors.appWhite,
                        ),
                      ),
                    ),
                  ].map((Widget child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: child,
                    );
                  }).toList(),
                );
              },
            ),
            DescriptionCard(
              descriptionText: AppStrings.of(context).disclaimer,
              descriptionStyle: appTheme.textTheme.subtitle2,
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
    );
  }
}
