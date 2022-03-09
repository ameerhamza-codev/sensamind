import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mindwatch/connectors/app_connector.dart';
import 'package:mindwatch/intl/app_strings.dart';
import 'package:mindwatch/utils/app_colors.dart';
import 'package:mindwatch/utils/app_loader.dart';
import 'package:mindwatch/utils/app_routes.dart';
import 'package:mindwatch/utils/app_theme.dart';
import 'package:mindwatch/utils/app_validators.dart';
import 'package:mindwatch/views/widgets/app_bar.dart';
import 'package:mindwatch/views/widgets/app_scaffold.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _passwordVisibility = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: const Text('Register'),
      ),
      scaffoldBackground: Container(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  hintText: AppStrings.of(context).firstNameHint,
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return AppStrings.of(context).requiredField;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  hintText: AppStrings.of(context).lastNameHint,
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return AppStrings.of(context).requiredField;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: AppStrings.of(context).emailHint,
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
                  } else if (value.length < 8) {
                    return AppStrings.of(context).passwordLength;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  hintText: AppStrings.of(context).addressHint,
                ),
                validator: (String value) {
                  if (value.isEmpty) {
                    return AppStrings.of(context).requiredField;
                  } else if (value.length > 10) {
                    return AppStrings.of(context).max10Chars;
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
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                  if (newViewModel.isRegistered == true) {
                    _onRegistrationSuccessful();
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
                        model.signUp(
                          email: _emailController.text.trim(),
                          name: _firstNameController.text +
                              ' ' +
                              _lastNameController.text,
                          password: _passwordController.text,
                          zipCode: _addressController.text,
                        );
                      }
                    },
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      AppStrings.of(context).signUp,
                      style: appTheme.textTheme.subtitle2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
              Container(
                height: 40,
                alignment: Alignment.topCenter,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: AppStrings.of(context).or,
                    style: appTheme.textTheme.subtitle2,
                    children: <TextSpan>[
                      TextSpan(
                        text: AppStrings.of(context).signIn,
                        style: appTheme.textTheme.subtitle2
                            .copyWith(color: AppColors.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _onSignInTapped,
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
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisibility = !_passwordVisibility;
    });
  }

  void _onSignInTapped() {
    Navigator.of(context).pop();
  }

  void _onRegistrationSuccessful() {
    Navigator.of(context)
        .pushReplacementNamed(AppRoutes.registrationSuccessful.path);
  }
}
