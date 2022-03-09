import 'package:flutter/material.dart';
import 'package:mindwatch/intl/app_strings.dart';
import 'package:mindwatch/utils/app_colors.dart';
import 'package:mindwatch/utils/app_routes.dart';

class HelpIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(AppRoutes.help.path);
      },
      icon: const Icon(Icons.help),
    );
  }
}

class HelpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RaisedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.help.path);
        },
        child: Text(
          AppStrings.of(context).help,
          style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.appWhite,
              ),
        ),
      ),
    );
  }
}
