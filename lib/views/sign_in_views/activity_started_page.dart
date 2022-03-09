import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindwatch/intl/app_strings.dart';
import 'package:mindwatch/utils/app_assets.dart';
import 'package:mindwatch/utils/app_colors.dart';
import 'package:mindwatch/utils/app_routes.dart';
import 'package:mindwatch/utils/app_theme.dart';
import 'package:mindwatch/views/widgets/app_scaffold.dart';

class ActivityStartedPage extends StatefulWidget {
  @override
  _ActivityStartedPageState createState() => _ActivityStartedPageState();
}

class _ActivityStartedPageState extends State<ActivityStartedPage> {
  final TextEditingController _ageController = TextEditingController();

  @override
  void dispose() {
    _ageController.dispose();
    super.dispose();
  }

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
                AppStrings.of(context).mwBetaGroup,
                style: appTheme.textTheme.subtitle2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                child: Text(
                  AppStrings.of(context).setupProcess,
                  style: appTheme.textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
              ),
              TextFormField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  hintText: AppStrings.of(context).ageHint,
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return AppStrings.of(context).requiredField;
                  }
                  return null;
                },
              ),
              MaterialButton(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                onPressed: () {
                  _onStartSetupTapped(context);
                },
                color: AppColors.primaryColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Text(
                    AppStrings.of(context).startSetup,
                    style: appTheme.textTheme.subtitle2
                        .copyWith(color: AppColors.appWhite),
                  ),
                ),
              ),
              Expanded(
                child: Image.asset(
                  AppAssets.setup,
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

  void _onStartSetupTapped(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.signInActivity1.path,arguments: _ageController.text);
  }
}
