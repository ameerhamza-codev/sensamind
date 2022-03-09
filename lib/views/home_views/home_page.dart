import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:mindwatch/connectors/app_connector.dart';
import 'package:mindwatch/intl/app_strings.dart';
import 'package:mindwatch/utils/app_colors.dart';
import 'package:mindwatch/utils/app_description_card.dart';
import 'package:mindwatch/utils/app_theme.dart';
import 'package:mindwatch/views/widgets/app_bar.dart';
import 'package:mindwatch/views/widgets/app_logo.dart';
import 'package:mindwatch/views/widgets/app_scaffold.dart';
import 'package:mindwatch/views/widgets/scaffold_bg.dart';
import 'package:vibration/vibration.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AudioCache _player = AudioCache(prefix: 'assets/audio/');

  bool _submitting = false;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _snackController;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        automaticallyImplyLeading: true,
        title: Text(
          AppStrings.of(context).welcome,
        ),
        actions: <Widget>[
          AppLogo(),
          IconButton(
            icon: const Icon(Icons.help),
            onPressed: () => showDialog<void>(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text('Help'),
                    content: DescriptionCard(
                      descriptionText:
                          '''${AppStrings.of(context).reasonsDescription}
${AppStrings.of(context).reasonPressedDescription}''',
                    ),
                  );
                }),
          ),
        ],
      ),
      scaffoldBackground: ScaffoldBg(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            AppConnector(
              condition:
                  (AppViewModel oldViewModel, AppViewModel newViewModel) {
                if (!oldViewModel.isLoading && newViewModel.isLoading) {
                  newViewModel.showAlert(
                    context: context,
                    dismissible: false,
                    child: AlertDialog(
                      content: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(AppStrings.of(context).savingYourDetails),
                          const CircularProgressIndicator(
                            backgroundColor: AppColors.primaryColor,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                if (!newViewModel.isLoading && _submitting) {
                  _submitting = false;
                  _onComplete(newViewModel);
                }
                return true;
              },
              builder: (BuildContext context, AppViewModel model) {
                final List<String> _buttonOneReasons = <String>[
                  model.appInfo.userDetails.buttonOneDetails.cause1,
                  model.appInfo.userDetails.buttonOneDetails.cause2,
                  model.appInfo.userDetails.buttonOneDetails.cause3,
                  model.appInfo.userDetails.buttonOneDetails.cause4,
                  model.appInfo.userDetails.buttonOneDetails.cause5,
                ];
                final List<String> _buttonTwoReasons = <String>[
                  model.appInfo.userDetails.buttonTwoDetails.cause1,
                  model.appInfo.userDetails.buttonTwoDetails.cause2,
                  model.appInfo.userDetails.buttonTwoDetails.cause3,
                  model.appInfo.userDetails.buttonTwoDetails.cause4,
                  model.appInfo.userDetails.buttonTwoDetails.cause5,
                ];

                return Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8.0),
                      child: DescriptionCard(
                        descriptionText:
                            '\n${model.appInfo.userDetails.buttonOneDetails.buttonLabel}\n',
                        descriptionStyle: appTheme.textTheme.headline6,
                      ),
                    ),
                    Text(
                      'What do you think the reason could be?',
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Wrap(
                      runSpacing: 8.0,
                      alignment: WrapAlignment.center,
                      spacing: 8.0,
                      children: _buttonOneReasons.map(
                        (String reason) {
                          return RaisedButton(
                            onPressed: () async {
                              _submit(model, reason);
                            },
                            child: Text(
                              reason,
                              style: appTheme.textTheme.subtitle2.copyWith(
                                  // color: AppColors.appWhite,
                                  ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      width: double.infinity,
                      child: DescriptionCard(
                        descriptionText:
                            '\n${model.appInfo.userDetails.buttonTwoDetails.buttonLabel}\n',
                        descriptionStyle: appTheme.textTheme.headline6,
                      ),
                    ),
                    Text(
                      'What do you think the reason could be?',
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Wrap(
                      runSpacing: 8.0,
                      alignment: WrapAlignment.center,
                      spacing: 8.0,
                      children: _buttonTwoReasons.map(
                        (String reason) {
                          return RaisedButton(
                            onPressed: () async {
                              _submit(model, reason);
                            },
                            child: Text(
                              reason,
                              style: appTheme.textTheme.subtitle2.copyWith(
                                  // color: AppColors.appWhite,
                                  ),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _submit(AppViewModel model, String reason) {
    _submitting = true;
    model.reasonSubmit(
      button: model.appInfo.userDetails.buttonTwoDetails,
      cause: reason,
    );
  }

  Future<void> _onComplete(AppViewModel model) async {
    // stop loading
    Navigator.of(context).pop();
    // Navigator.of(context).popUntil(
    //   ModalRoute.withName(AppRoutes.initPage.path),
    // );
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate();
    }
    _snackController?.close?.call();
    _snackController = _scaffoldKey.currentState.showSnackBar(const SnackBar(
      content: Text('Submitted the result!'),
      duration: Duration(seconds: 3),
    ));
    final int value = Random().nextInt(3) + 1;
    if (model.playSounds) {
      await _player.play('audio$value.mp3');
    }
  }
}
