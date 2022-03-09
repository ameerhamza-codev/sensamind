import 'package:flutter/material.dart';
import 'package:mindwatch/connectors/app_connector.dart';
import 'package:mindwatch/intl/app_strings.dart';
import 'package:mindwatch/utils/app_assets.dart';
import 'package:mindwatch/utils/app_colors.dart';
import 'package:mindwatch/utils/app_loader.dart';
import 'package:mindwatch/utils/app_routes.dart';
import 'package:mindwatch/utils/app_theme.dart';
import 'package:mindwatch/utils/app_validators.dart';
import 'package:mindwatch/views/widgets/app_scaffold.dart';

class UnlockUserPage extends StatefulWidget {
  @override
  _UnlockUserPageState createState() => _UnlockUserPageState();
}

class _UnlockUserPageState extends State<UnlockUserPage> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
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
                AppStrings.of(context).unlockAccount,
                style: appTheme.textTheme.subtitle2
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration().copyWith(
                        hintText: AppStrings.of(context).emailHint,
                      ),
                      validator: (String value) {
                        if (!Validators().isValidEmail(value)) {
                          return AppStrings.of(context).invalidEmail;
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (BuildContext context) => AppConnector(
                  condition:
                      (AppViewModel oldViewModel, AppViewModel newViewModel) {
                    if (newViewModel.exceptionMessage != null) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(newViewModel.exceptionMessage),
                        ),
                      );
                    }
                    if (oldViewModel.isLocked != newViewModel.isLocked) {
                      _onUserUnlock(context);
                    }
                    return true;
                  },
                  builder: (BuildContext context, AppViewModel model) {
                    if (model.isLoading) {
                      return AppLoader();
                    }
                    return MaterialButton(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          model.unlockUser(email: _emailController.text.trim());
                        }
                      },
                      color: AppColors.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        child: Text(
                          AppStrings.of(context).unlock,
                          style: appTheme.textTheme.subtitle2.copyWith(
                            color: AppColors.appWhite,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Image.asset(
                  AppAssets.unlock,
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

  void _onUserUnlock(BuildContext context) {
    Navigator.of(context)
        .pushReplacementNamed(AppRoutes.registrationSuccessful.path);
  }
}
