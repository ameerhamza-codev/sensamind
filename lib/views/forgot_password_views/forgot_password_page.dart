import 'package:flutter/material.dart';
import 'package:mindwatch/connectors/app_connector.dart';
import 'package:mindwatch/intl/app_strings.dart';
import 'package:mindwatch/utils/app_colors.dart';
import 'package:mindwatch/utils/app_routes.dart';
import 'package:mindwatch/utils/app_theme.dart';
import 'package:mindwatch/utils/app_validators.dart';
import 'package:mindwatch/views/widgets/app_bar.dart';
import 'package:mindwatch/views/widgets/app_scaffold.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
      appBar: CustomAppBar(),
      scaffoldBackground: Container(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppStrings.of(context).forgotPasswordExtended,
                  style: appTheme.textTheme.headline4,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                child: Text(
                  AppStrings.of(context).resetLink,
                  style: appTheme.textTheme.subtitle2.copyWith(
                    color: AppColors.resendLinkColor,
                  ),
                ),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: AppStrings.of(context).emailHint,
                ),
                validator: (String value) {
                  if (!Validators().isValidEmail(value)) {
                    return AppStrings.of(context).invalidEmail;
                  }
                  return null;
                },
              ),
              Builder(
                builder: (BuildContext context) => AppConnector(condition:
                    (AppViewModel oldViewModel, AppViewModel newViewModel) {
                  if (newViewModel.exceptionMessage != null) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(newViewModel.exceptionMessage),
                      ),
                    );
                  }
                  return true;
                }, builder: (BuildContext context, AppViewModel model) {
                  return RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        model
                            .forgotPassword(
                          email: _emailController.text.trim(),
                        )
                            .then(
                          (void value) {
                            return Navigator.of(context).pushNamed(
                              AppRoutes.resetPasswordSubmitted.path,
                            );
                          },
                        ).catchError(
                          (Object e) {
                            Scaffold.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Sorry, unable to send email. Please try again!',
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: Text(
                      AppStrings.of(context).sendLink,
                      style: appTheme.textTheme.headline6,
                    ),
                  );
                }),
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
