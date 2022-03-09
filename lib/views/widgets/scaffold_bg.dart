import 'package:flutter/material.dart';
import 'package:mindwatch/utils/app_assets.dart';

class ScaffoldBg extends StatelessWidget {
  const ScaffoldBg({Key key, this.asset}) : super(key: key);

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(asset ?? AppAssets.background),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
