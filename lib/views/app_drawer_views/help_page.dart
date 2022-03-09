import 'package:flutter/material.dart';
import 'package:mindwatch/intl/app_strings.dart';
import 'package:mindwatch/utils/app_colors.dart';
import 'package:mindwatch/utils/app_description_card.dart';
import 'package:mindwatch/utils/app_theme.dart';
import 'package:mindwatch/views/widgets/app_bar.dart';
import 'package:mindwatch/views/widgets/app_scaffold.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        automaticallyImplyLeading: true,
        title: Text(
          AppStrings.of(context).help,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  AppStrings.of(context).helpDescription,
                  style: appTheme.textTheme.title,
                  textAlign: TextAlign.center,
                ),
              ),
              _ButtonBuilder(
                description: AppStrings.of(context).videoDescription,
                buttonLabel: AppStrings.of(context).videoTutorials,
                callback: () {},
              ),
              _ButtonBuilder(
                description: AppStrings.of(context).faqDescription,
                buttonLabel: AppStrings.of(context).faqForYou,
                callback: () {},
              ),
              _ButtonBuilder(
                description: AppStrings.of(context).issuesDescription,
                buttonLabel: AppStrings.of(context).contactSupport,
                callback: () {},
              ),
              _ButtonBuilder(
                description: AppStrings.of(context).chatDescription,
                buttonLabel: AppStrings.of(context).connectNow,
                callback: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ButtonBuilder extends StatelessWidget {
  const _ButtonBuilder(
      {Key key, this.buttonLabel, this.description, this.callback})
      : super(key: key);

  final String buttonLabel;
  final String description;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: DescriptionCard(
            descriptionText: description,
            descriptionStyle: appTheme.textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
        ),
        MaterialButton(
          onPressed: () => callback?.call,
          color: appTheme.primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.elliptical(96, 96),
            ),
          ),
          minWidth: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Text(
            buttonLabel,
            style: appTheme.textTheme.title.copyWith(
              color: AppColors.appWhite,
            ),
          ),
        ),
        const Divider(),
      ].map((Widget child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: child,
        );
      }).toList(),
    );
  }
}
