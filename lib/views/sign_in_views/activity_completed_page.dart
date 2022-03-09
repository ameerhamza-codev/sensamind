import 'package:flutter/material.dart';
import 'package:mindwatch/intl/app_strings.dart';
import 'package:mindwatch/utils/app_assets.dart';
import 'package:mindwatch/utils/app_colors.dart';
import 'package:mindwatch/utils/app_routes.dart';
import 'package:mindwatch/utils/app_theme.dart';
import 'package:mindwatch/views/widgets/app_scaffold.dart';

class ActivityCompletedPage extends StatelessWidget {
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
              Text(
                AppStrings.of(context).useSensaMind,
                textAlign: TextAlign.center,
                style: appTheme.textTheme.headline,
              ),
              MaterialButton(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(96, 96),
                  ),
                ),
                onPressed: () => _onButtonTapHandler(context),
                color: AppColors.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  child: Text(
                    AppStrings.of(context).letsBegin,
                    style: appTheme.textTheme.headline.copyWith(
                      color: AppColors.appWhite,
                    ),
                  ),
                ),
              ),
              Expanded(
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

  void _onButtonTapHandler(BuildContext context) {
    Navigator.of(context).popUntil(
      ModalRoute.withName(
        AppRoutes.initPage.path,
      ),
    );
  }
}
