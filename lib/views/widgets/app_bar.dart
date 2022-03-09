import 'package:flutter/material.dart';
import 'package:mindwatch/utils/app_assets.dart';
import 'package:mindwatch/utils/app_colors.dart';
import 'package:mindwatch/views/widgets/app_logo.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key key,
    Widget leading,
    bool automaticallyImplyLeading = true,
    Widget title,
    List<Widget> actions,
    Widget flexibleSpace,
    PreferredSizeWidget bottom,
    double elevation = 4.0,
    ShapeBorder shape,
    Color backgroundColor,
    Brightness brightness,
    IconThemeData iconTheme,
    IconThemeData actionsIconTheme,
    TextTheme textTheme,
    bool primary = true,
    bool centerTitle,
    double titleSpacing = NavigationToolbar.kMiddleSpacing,
    double toolbarOpacity = 1.0,
    double bottomOpacity = 1.0,
  }) : super(
          key: key,
          leading: leading,
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: title,
          actions: actions ?? [Container(width: 102, child: AppLogo())],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              // gradient: LinearGradient(
              //   colors: <Color>[
              //     Colors.deepPurple,
              //     AppColors.primaryColorLight,
              //   ],
              //   begin: Alignment.bottomLeft,
              //   end: Alignment.topRight,
              //   stops: <double>[0.0, 1.0],
              //   tileMode: TileMode.clamp,
              // ),
            ),
            child: flexibleSpace,
          ),
          bottom: bottom,
          elevation: elevation ?? 0.0,
          shape: shape,
          backgroundColor: backgroundColor,
          brightness: brightness,
          iconTheme: iconTheme,
          actionsIconTheme: actionsIconTheme,
          textTheme: textTheme,
          primary: primary,
          centerTitle: centerTitle,
          titleSpacing: titleSpacing,
          toolbarOpacity: toolbarOpacity,
          bottomOpacity: bottomOpacity,
        );
}
