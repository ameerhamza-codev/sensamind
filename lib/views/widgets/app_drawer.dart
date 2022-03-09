import 'package:flutter/material.dart';
import 'package:mindwatch/connectors/app_connector.dart';
import 'package:mindwatch/intl/app_strings.dart';
import 'package:mindwatch/utils/app_assets.dart';
import 'package:mindwatch/utils/app_colors.dart';
import 'package:mindwatch/utils/app_routes.dart';
import 'package:mindwatch/utils/app_theme.dart';
import 'package:mindwatch/views/widgets/app_logo.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      iconColor: AppColors.primaryColor,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: AppLogo(),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(
                AppStrings.of(context).home,
                style: appTheme.textTheme.subtitle2,
              ),
              onTap: () => _onHomeTapped(context),
            ),
            ListTile(
              leading: const Icon(Icons.trending_up),
              title: Text(
                AppStrings.of(context).statistics,
                style: appTheme.textTheme.subtitle2,
              ),
              onTap: () => _onStatisticsTapped(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text(
                AppStrings.of(context).settings,
                style: appTheme.textTheme.subtitle2,
              ),
              onTap: () => _onSettingsTapped(context),
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: Text(
                AppStrings.of(context).help,
                style: appTheme.textTheme.subtitle2,
              ),
              onTap: () => _onHelpTapped(context),
            ),
            ListTile(
              leading: const Icon(Icons.chat_bubble_outline),
              title: Text(
                AppStrings.of(context).chat,
                style: appTheme.textTheme.subtitle2,
              ),
              onTap: () => _onChatTapped(context),
            ),
            AppConnector(
              builder: (BuildContext context, AppViewModel model) {
                return ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: Text(
                    AppStrings.of(context).logout,
                    style: appTheme.textTheme.subtitle2,
                  ),
                  onTap: () {
                    final Widget dialog = AppConnector(
                      condition: (AppViewModel oldViewModel,
                          AppViewModel newViewModel) {
                        if (!newViewModel.isAuthenticated) {
                          Navigator.of(context).popUntil(
                              ModalRoute.withName(AppRoutes.initPage.path));
                          return false;
                        }
                        return true;
                      },
                      builder: (BuildContext ctx, AppViewModel model) {
                        return AlertDialog(
                          title:
                              Text(AppStrings.of(context).logOutConfirmation),
                          content: model.isLoading
                              ? Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    CircularProgressIndicator(
                                      backgroundColor: AppColors.primaryColor,
                                    ),
                                  ],
                                )
                              : Text(
                                  AppStrings.of(context)
                                      .logOutConfirmationExtended,
                                ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text(AppStrings.of(context).confirm),
                              onPressed: () => model.logOut(),
                            ),
                            FlatButton(
                              child: Text(AppStrings.of(context).cancel),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                          ],
                        );
                      },
                    );
                    model.showAlert(
                      context: context,
                      child: dialog,
                    );
                  },
                );
              },
            ),
          ].map((Widget child) {
            if (child is! DrawerHeader) {
              return Column(
                children: <Widget>[
                  child,
                  const Divider(
                    height: 2,
                  ),
                ],
              );
            }
            return child;
          }).toList(),
        ),
      ),
    );
  }

  void _onHelpTapped(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(AppRoutes.help.path);
  }

  void _onSettingsTapped(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(AppRoutes.settings.path);
  }

  void _onStatisticsTapped(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(AppRoutes.statistics.path);
  }

  void _onHomeTapped(BuildContext context) {
    Navigator.of(context)
        .popUntil(ModalRoute.withName(AppRoutes.initPage.path));
  }

  void _onChatTapped(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(AppRoutes.chat.path);
  }
}
