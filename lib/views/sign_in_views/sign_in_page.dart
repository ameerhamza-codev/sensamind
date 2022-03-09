import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mindwatch/connectors/app_connector.dart';
import 'package:mindwatch/intl/app_strings.dart';
import 'package:mindwatch/utils/app_assets.dart';
import 'package:mindwatch/utils/app_colors.dart';
import 'package:mindwatch/utils/app_loader.dart';
import 'package:mindwatch/utils/app_routes.dart';
import 'package:mindwatch/utils/app_theme.dart';
import 'package:mindwatch/utils/app_utils.dart';
import 'package:mindwatch/utils/app_validators.dart';
import 'package:mindwatch/views/widgets/app_scaffold.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _userNameController;

  TextEditingController _passwordController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisibility = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController(
      text: AppUtils.isDebugMode ? 'testterr2020@gmail.com' : '',
    );
    _passwordController = TextEditingController(
      text: AppUtils.isDebugMode ? '12345678' : '',
    );
  }

  @override
  void dispose() {
    super.dispose();
    _userNameController?.dispose();
    _passwordController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffold(
        key: _scaffoldKey,
        scaffoldBackground: Container(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.5,
                  child: Image.asset(
                    AppAssets.appLogo,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                TextFormField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    hintText: AppStrings.of(context).userNameHint,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (String value) {
                    if (!Validators().isValidEmail(value)) {
                      return AppStrings.of(context).invalidEmail;
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _passwordVisibility,
                  decoration: InputDecoration(
                    hintText: AppStrings.of(context).passwordHint,
                    suffixIcon: IconButton(
                      onPressed: _togglePasswordVisibility,
                      icon: Icon(
                        _passwordVisibility
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.appBlack,
                      ),
                    ),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return AppStrings.of(context).requiredField;
                    }
                    return null;
                  },
                ),
                AppConnector(
                  condition:
                      (AppViewModel oldViewModel, AppViewModel newViewModel) {
                    if (newViewModel.exceptionMessage != null) {
                      _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                          content: Text(newViewModel.exceptionMessage),
                        ),
                      );
                    }
                    if (newViewModel.isLocked) {
                      _onAccountLocked();
                    }
                    return true;
                  },
                  builder: (BuildContext context, AppViewModel model) {
                    if (model.isLoading) {
                      return AppLoader();
                    }
                    return RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          model.logIn(
                            email: _userNameController.text.trim(),
                            password: _passwordController.text,
                          );
                        }
                      },
                      color: AppColors.primaryColor,
                      child: Text(
                        AppStrings.of(context).login,
                        style: appTheme.textTheme.title.copyWith(
                          color: AppColors.appWhite,
                        ),
                      ),
                    );
                  },
                ),
                FlatButton(
                  onPressed: _onForgotPasswordTapped,
                  child: Text(
                    AppStrings.of(context).forgotPassword,
                    style: appTheme.textTheme.title
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ),
                // Expanded(
                //   child: Image.asset(
                //     AppAssets.signIn,
                //     fit: BoxFit.fitWidth,
                //   ),
                // ),
                Container(
                  height: 40,
                  alignment: Alignment.topCenter,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: AppStrings.of(context).noAccount,
                      style: appTheme.textTheme.title,
                      children: <TextSpan>[
                        TextSpan(
                          text: AppStrings.of(context).signUp,
                          style: appTheme.textTheme.title
                              .copyWith(color: AppColors.primaryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = _onSignUpTapped,
                        )
                      ],
                    ),
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
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisibility = !_passwordVisibility;
    });
  }

  void _onForgotPasswordTapped() {
    Navigator.of(context).pushNamed(AppRoutes.forgotPassword.path);
  }

  void _onSignUpTapped() {
    Navigator.of(context).pushNamed(AppRoutes.signUp.path);
  }

  void _onAccountLocked() {
    Navigator.of(context).pushNamed(AppRoutes.unlockUser.path);
  }
}
