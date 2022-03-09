import 'package:flutter/material.dart';
import 'package:mindwatch/utils/app_colors.dart';

class AppLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
