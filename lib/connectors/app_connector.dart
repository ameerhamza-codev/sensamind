import 'package:charts_flutter/flutter.dart' as c;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwatch/blocs/app_bloc/app_bloc.dart';
import 'package:mindwatch/blocs/app_bloc/app_event.dart';
import 'package:mindwatch/blocs/app_bloc/app_state.dart';
import 'package:mindwatch/models/app_info.dart';
import 'package:mindwatch/models/bt_click_data.dart';
import 'package:mindwatch/models/click_data.dart';
import 'package:mindwatch/models/click_statistics.dart';
import 'package:mindwatch/models/sign_in_success.dart';
import 'package:mindwatch/models/user_stats.dart';
import 'package:mindwatch/utils/app_colors.dart';

@immutable
class AppViewModel {
  const AppViewModel({
    @required ValueChanged<AppEvent> dispatch,
    @required AppState state,
  })  : assert(state != null),
        assert(dispatch != null),
        _state = state,
        _dispatch = dispatch;

  final ValueChanged<AppEvent> _dispatch;

  final AppState _state;

  String get exceptionMessage => _state.exceptionMessage;

  bool get isLoading => _state.loading;

  bool get playSounds => _state.playSounds;

  bool get showNotifications => _state.showNotifications;

  bool get isInitializing => _state.initializing;

  SignInSuccess get currentUserDetails => _state.userDetails;

  bool get isAuthenticated => _state.isAuthenticated;

  bool get isRegistered => _state.isRegistered;

  bool get isLocked => _state.isLocked;

  bool get isSetupCompleted => _state.isSetupCompleted;

  UserStats get userStats => _state.userStats;

  ClickStatistics get clickStats => _state.clickStatistics;

  AppInfo get appInfo => _state.appInfo;

  List<c.Series<CauseClickData, String>> getChartData(Statistics stats) {
    return [
      c.Series<CauseClickData, String>(
        id: 'Statistics',
        domainFn: (CauseClickData causes, _) => causes.cause,
        measureFn: (CauseClickData causes, _) =>
            int.parse(causes.total.toString()),
        data: stats?.causeClickData?.toList(),
        labelAccessorFn: (CauseClickData row, _) =>
            '${((int.parse(row.total.toString()) / stats.total) * 100).toStringAsFixed(1)}%',
        colorFn: (CauseClickData row, _) {
          final double percent =
              (int.tryParse(row.total.toString()) ?? 0) / stats.total;
          final Color color = Colors.accents[_] ?? AppColors.primaryColor;
          return c.Color(
            r: color.red,
            b: color.blue,
            g: color.green,
            a: color.alpha,
          );
        },
        seriesColor: c.Color(
          r: AppColors.primaryColor.red,
          b: AppColors.primaryColor.blue,
          g: AppColors.primaryColor.green,
          a: AppColors.primaryColor.alpha,
        ),
      )
    ];
  }

  void init() {
    _dispatch(InitAppEvent());
  }

  void logIn({String email, String password}) {
    _dispatch(
      LoginEvent(
        email: email,
        password: password,
      ),
    );
  }

  void signUp({
    String name,
    String email,
    String password,
    String zipCode,
  }) {
    _dispatch(
      SignUpEvent(
        name: name,
        email: email,
        password: password,
        zipCode: zipCode,
      ),
    );
  }

  void logOut() {
    _dispatch(
      LogOutEvent(
        email: currentUserDetails.currentUser.email,
        authKey: currentUserDetails.token,
      ),
    );
  }

  void getUserStats() {
    _dispatch(
      GetUserStatsEvent(),
    );
  }

  void activitySubmit({int gender, String argued, String age, String set}) {
    final Map<String, String> body = <String, String>{
      'gender': '$gender',
      'argued': '$argued'.toLowerCase(),
      'age': '$age',
    };
    _dispatch(
      ActivitySubmitEvent(body: body),
    );
  }

  void reasonSubmit({ButtonDetails button, String cause}) {
    final List<ClickData> _body = <ClickData>[
      ClickData((ClickDataBuilder b) => b
        ..button = button.buttonLabel
        ..buttonId = '${button.id}'
        ..cause = cause
        ..clickedAt = DateTime.now().toUtc().toString().split('.').first)
    ];
    _dispatch(
      UserSubmitClickEvent(
        token: currentUserDetails.token,
        body: _body,
      ),
    );
  }

  void unlockUser({String email}) {
    _dispatch(UnlockAccountEvent(email: email));
  }

  Future<void> forgotPassword({String email}) {
    final ForgotPasswordEvent forgotPasswordEvent =
        ForgotPasswordEvent(email: email);
    _dispatch(forgotPasswordEvent);
    return forgotPasswordEvent.future;
  }

  void showAlert(
      {BuildContext context, bool dismissible = true, Widget child}) {
    showDialog<AlertDialog>(
        context: context,
        barrierDismissible: dismissible,
        builder: (BuildContext context) {
          return child;
        });
  }

  void toggleSettings({bool playSounds, bool showNotifications}) {
    _dispatch(ToggleSettingsEvent(
      playSounds: playSounds,
      showNotifications: showNotifications,
    ));
  }

  void sendBTButtonClick(BtClickData d) {
    final List<Map<String, dynamic>> _body = <Map<String, dynamic>>[
      <String, dynamic>{
        'button': d.button,
        'clicked_at': DateTime.now().toUtc().toString().split('.').first,
      }
    ];
    _dispatch(SendBTData(_body));
  }
}

class AppConnector extends StatelessWidget {
  const AppConnector({Key key, this.builder, this.condition}) : super(key: key);
  final BlocWidgetBuilder<AppViewModel> builder;
  final BlocBuilderCondition<AppViewModel> condition;

  @override
  Widget build(BuildContext context) {
    final AppBloc _bloc = BlocProvider.of<AppBloc>(context);

    return BlocBuilder<AppBloc, AppState>(
      cubit: _bloc,
      buildWhen: (AppState oState, AppState nState) {
        return condition?.call(
          AppViewModel(dispatch: _bloc.add, state: oState),
          AppViewModel(dispatch: _bloc.add, state: nState),
        );
      },
      builder: (BuildContext context, AppState state) {
        return builder(
          context,
          AppViewModel(dispatch: _bloc.add, state: state),
        );
      },
    );
  }
}
