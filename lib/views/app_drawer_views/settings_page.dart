import 'package:flutter/material.dart';
import 'package:mindwatch/connectors/app_connector.dart';
import 'package:mindwatch/intl/app_strings.dart';
import 'package:mindwatch/utils/app_colors.dart';
import 'package:mindwatch/utils/app_description_card.dart';
import 'package:mindwatch/utils/app_routes.dart';
import 'package:mindwatch/utils/app_theme.dart';
import 'package:mindwatch/views/widgets/app_bar.dart';
import 'package:mindwatch/views/widgets/app_scaffold.dart';
import 'package:mindwatch/views/widgets/help_button.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationSwitchValue;
  bool _soundSwitchValue;

  @override
  Widget build(BuildContext context) {
    const Divider divider = Divider(
      height: 32,
    );
    return AppConnector(
      builder: (BuildContext context, AppViewModel model) {
        _notificationSwitchValue = model.showNotifications;
        _soundSwitchValue = model.playSounds;

        return AppScaffold(
          appBar: CustomAppBar(
            automaticallyImplyLeading: true,
            title: Text(
              AppStrings.of(context).settings,
            ),
            actions: [HelpIcon()],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              AppStrings.of(context).settingsDescription,
                              style: appTheme.textTheme.title,
                            ),
                          ),
                          SwitchListTile(
                            onChanged: (bool value) {
                              _onSoundToggle(value, model);
                            },
                            activeColor: AppColors.primaryColor,
                            value: _soundSwitchValue,
                            title: Text(
                              AppStrings.of(context).toggleSounds,
                              style: appTheme.textTheme.subhead,
                            ),
                          ),
                          SwitchListTile(
                            onChanged: (bool value) {
                              _onNotificationToggle(value, model);
                            },
                            value: _notificationSwitchValue,
                            activeColor: AppColors.primaryColor,
                            title: Text(
                              AppStrings.of(context).toggleNotifications,
                              style: appTheme.textTheme.subhead,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  divider,
                  DescriptionCard(
                    descriptionText:
                        AppStrings.of(context).bluetoothDescription,
                    descriptionStyle: appTheme.textTheme.subhead,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.bleHome.path);
                      },
                      child: Text(
                        AppStrings.of(context).connectToBluetooth,
                        style: appTheme.textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  divider,
                  DescriptionCard(
                    descriptionText: AppStrings.of(context).signOutDescription,
                    descriptionStyle: appTheme.textTheme.subhead,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: RaisedButton(
                      onPressed: () {
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
                              title: Text(
                                  AppStrings.of(context).logOutConfirmation),
                              content: model.isLoading
                                  ? Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const <Widget>[
                                        CircularProgressIndicator(
                                          backgroundColor:
                                              AppColors.primaryColor,
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
                                  textColor: Theme.of(context).primaryColor,
                                ),
                                FlatButton(
                                  child: Text(AppStrings.of(context).cancel),
                                  onPressed: () => Navigator.of(context).pop(),
                                  textColor: Theme.of(context).primaryColor,
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
                      color: appTheme.primaryColor,
                      child: Text(
                        AppStrings.of(context).logout,
                        style: appTheme.textTheme.subhead.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.appWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onSoundToggle(bool value, AppViewModel model) {
    model.toggleSettings(
      playSounds: value,
      showNotifications: _notificationSwitchValue,
    );
  }

  void _onNotificationToggle(bool value, AppViewModel model) {
    model.toggleSettings(
      playSounds: _soundSwitchValue,
      showNotifications: value,
    );
  }
}
