import 'package:flutter/material.dart';
import 'package:mindwatch/utils/app_assets.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        AppAssets.appLogo,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
