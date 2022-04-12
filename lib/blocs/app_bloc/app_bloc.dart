import 'dart:convert';

import 'package:built_collection/src/list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwatch/blocs/app_bloc/app_event.dart';
import 'package:mindwatch/blocs/app_bloc/app_state.dart';
import 'package:mindwatch/blocs/application_bloc.dart';
import 'package:mindwatch/data/ble_service.dart';
import 'package:mindwatch/data/data_service.dart';
import 'package:mindwatch/data/preferences_service.dart';
import 'package:mindwatch/models/activity_submit_result.dart';
import 'package:mindwatch/models/app_error.dart';
import 'package:mindwatch/models/app_info.dart';
import 'package:mindwatch/models/click_data.dart';
import 'package:mindwatch/models/click_statistics.dart';
import 'package:mindwatch/models/reason_submit_response.dart';
import 'package:mindwatch/models/sign_in_success.dart';
import 'package:mindwatch/models/user_stats.dart';
import 'package:mindwatch/models/user_unlock.dart';

class AppBloc extends ApplicationBloc<AppEvent, AppState> {
  AppBloc({
    AppState initialState,
    @required DataService dataService,
    @required PreferencesService prefs,
    @required BLEService bleService,
  })  : assert(dataService != null),
        assert(prefs != null),
        assert(bleService != null),
        _dataService = dataService,
        _bleService = bleService,
        _preferencesService = prefs,
        super(initialState);

  final DataService _dataService;
  final PreferencesService _preferencesService;
  final BLEService _bleService;
  static const String _apiFailureResponse = '"success":false';

  static AppBloc of(BuildContext context) => BlocProvider.of<AppBloc>(context);

  BLEService get bleService => _bleService;

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
  }

  @override
  Map<Type, StateReducer<AppEvent, AppState>> get handlers =>
      <Type, StateReducer<AppEvent, AppState>>{
        InitAppEvent: StateReducer<InitAppEvent, AppState>(_init),
        LoginEvent: StateReducer<LoginEvent, AppState>(_login),
        SignUpEvent: StateReducer<SignUpEvent, AppState>(_signUp),
        LogOutEvent: StateReducer<LogOutEvent, AppState>(_logOut),
        UnlockAccountEvent: StateReducer<UnlockAccountEvent, AppState>(_unlock),
        ActivitySubmitEvent:
            StateReducer<ActivitySubmitEvent, AppState>(_activitySubmit),
        GetUserStatsEvent:
            StateReducer<GetUserStatsEvent, AppState>(_userStats),
        UserSubmitClickEvent:
            StateReducer<UserSubmitClickEvent, AppState>(_userSubmitClick),
        ForgotPasswordEvent:
            StateReducer<ForgotPasswordEvent, AppState>(_forgotPassword),
        ToggleSettingsEvent:
            StateReducer<ToggleSettingsEvent, AppState>(_toggleSettings),
        SendBTData: StateReducer<SendBTData, AppState>(_sendBtData),
      };

  AppState get initialState => AppState.initState();

  @override
  AppState setLoading(bool isLoading) {
    return (state.toBuilder()..loading = isLoading).build();
  }

  bool stringToBool(String data) {
    if (data?.toLowerCase() == 'true')
      return true;
    else
      return false;
  }

  bool isUserSetupCompleted(SignInSuccess userDetails) {
    if (userDetails != null)
      return userDetails.currentUser.argued.isNotEmpty &&
          userDetails.currentUser.age != '0';
    return false;
  }

  Stream<AppState> _init(InitAppEvent action) async* {
    AppInfo info;
    final SignInSuccess userDetails = _preferencesService.getUser();
    if (userDetails != null) {
      final String apiResponse = await _dataService.updateQuestions(
        email: userDetails.currentUser.email,
        token: userDetails.token,
      );
      if (!(apiResponse.contains(_apiFailureResponse) ||
          apiResponse.contains('error'))) {
        info =
            AppInfo.fromJson(json.decode(apiResponse) as Map<String, dynamic>);

        if (info != null && info.success) {
          _preferencesService.saveQuestions(info: info);
          yield* sendLocalData();
        } else {
          info ??= _preferencesService.getQuestions();
        }
      }
    }
    final AppStateBuilder b = state.toBuilder();
    b
      ..initializing = false
      ..exceptionMessage = null
      ..isRegistered = false
      ..isSetupCompleted = isUserSetupCompleted(userDetails)
      ..userDetails = userDetails?.toBuilder()
      ..appInfo = info?.toBuilder()
      ..isAuthenticated = userDetails?.currentUser != null;
    yield b.build();
  }

  Stream<AppState> _afterLogin(SignInSuccess userDetails) async* {
    _preferencesService.saveUser(userDetails: userDetails);

    final AppInfo info =
        AppInfo.fromJson(json.decode(await _dataService.updateQuestions(
      email: userDetails.currentUser.email,
      token: userDetails.token,
    )) as Map<String, dynamic>);
    _preferencesService.saveQuestions(info: info);
    yield (state.toBuilder()
          ..userDetails = userDetails.toBuilder()
          ..isSetupCompleted = isUserSetupCompleted(userDetails)
          ..appInfo = info.toBuilder()
          ..exceptionMessage = null
          ..isAuthenticated = true)
        .build();
  }

  Stream<AppState> _login(LoginEvent event) async* {
    final String details = await _dataService.authenticate(
      username: event.email,
      password: event.password,
    );
    if (details.contains(_apiFailureResponse) || details.contains('error')) {
      final AppError loginError =
          AppError.fromJson(json.decode(details) as Map<String, dynamic>);
      yield (state.toBuilder()..exceptionMessage = loginError.error.allMessage)
          .build();
      yield (state.toBuilder()..exceptionMessage = null).build();
    } else {
      final SignInSuccess userDetails = SignInSuccess.fromJson(json.decode(details) as Map<String, dynamic>);
      FirebaseMessaging().subscribeToTopic("announcement");

      FirebaseMessaging().getToken().then((value){
        final Map<String, String> data = <String, String>{
          "token":value,
          "email":userDetails.currentUser.email.toString(),
        };
        FirebaseFirestore.instance.collection('users').add(data);
      });

      yield* _afterLogin(userDetails);
    }
  }

  Stream<AppState> _signUp(SignUpEvent event) async* {
    final Map<String, String> _body = <String, String>{
      'name': event.name,
      'email': event.email,
      'password': event.password,
      'password_confirmation': event.password,
      'zipcode': event.zipCode,
    };
    final String details = await _dataService.signUp(body: _body);
    if (details.contains(_apiFailureResponse) || details.contains('error')) {
      final AppError signUpError =
          AppError.fromJson(json.decode(details) as Map<String, dynamic>);
      yield (state.toBuilder()..exceptionMessage = signUpError.error.allMessage)
          .build();
      yield (state.toBuilder()..exceptionMessage = null).build();
    } else {
      FirebaseMessaging().subscribeToTopic("announcement");

      FirebaseMessaging().getToken().then((value){
        final Map<String, String> data = <String, String>{
          "token":value,
          "email": event.email,
        };
        FirebaseFirestore.instance.collection('users').add(data);
      });
      yield (state.toBuilder()..isRegistered = true).build();
    }
  }

  Stream<AppState> _logOut(LogOutEvent event) async* {
    final bool success = await _dataService.logOut(
      email: event.email,
      authKey: event.authKey,
    );
    if (!success) {
      print('Logout Unsuccessful');
    }
    _preferencesService.saveUser(userDetails: null);
    _preferencesService.saveQuestions(info: null);
    _preferencesService.saveClickData(clickData: null);
    yield (initialState.toBuilder()..initializing = false).build();
  }

  Stream<AppState> _unlock(UnlockAccountEvent event) async* {
    final UserUnlock unlockedUser = await _dataService.unlockUser(
      email: event.email,
    );
    if (unlockedUser.result != _apiFailureResponse) {
      yield (state.toBuilder()..isLocked = false).build();
    } else {
      yield (state.toBuilder()
            ..exceptionMessage = unlockedUser.email.isNotEmpty
                ? unlockedUser.email
                : 'Unable to retrieve your account. Try again later')
          .build();
      yield (state.toBuilder()..exceptionMessage = null).build();
    }
  }

  Stream<AppState> _forgotPassword(ForgotPasswordEvent event) async* {
    final String response = await _dataService.forgotPassword(
      email: event.email,
    );
    print(response);

    if (response.contains(_apiFailureResponse)) {
      final AppError error =
          AppError.fromJson(json.decode(response) as Map<String, dynamic>);
      yield (state.toBuilder()..exceptionMessage = error.error.message).build();
      yield (state.toBuilder()..exceptionMessage = null).build();
      event.completeError();
    } else {
      yield (state.toBuilder()..isRegistered = true).build();
      event.complete();
    }
  }

  Stream<AppState> _activitySubmit(ActivitySubmitEvent event) async* {
    final String result = await _dataService.activitySubmission(
      token: state.userDetails.token,
      body: event.body,
    );
    if (result == null) {
      yield (state.toBuilder()
            ..exceptionMessage =
                'You must be online to complete this step. Please turn on the internet and try again')
          .build();
      yield (state.toBuilder()..exceptionMessage = null).build();
    } else if (result.contains(_apiFailureResponse)) {
      final AppError loginError =
          AppError.fromJson(json.decode(result) as Map<String, dynamic>);
      yield (state.toBuilder()..exceptionMessage = loginError.error.message)
          .build();
      yield (state.toBuilder()..exceptionMessage = null).build();
    } else {
      final ActivitySubmitResult activityResult = ActivitySubmitResult.fromJson(
          json.decode(result) as Map<String, dynamic>);
      final SignInSuccess existingUserDetails =
          _preferencesService.saveCurrentUser(user: activityResult.user);
      yield* _afterLogin(existingUserDetails);
    }
  }

  String mostClicked(List<ClickData> data, bool isButton) {
    final Map<String, List<ClickData>> _clickButtonMap =
        <String, List<ClickData>>{};
    final Map<String, List<ClickData>> _clickCauseMap =
        <String, List<ClickData>>{};
    if (data == null) {
      return '0';
    }
    for (final ClickData e in data) {
      _clickButtonMap[e.button] ??= <ClickData>[];
      _clickButtonMap[e.button].add(e);
      _clickCauseMap[e.cause] ??= <ClickData>[];
      _clickCauseMap[e.cause].add(e);
    }
    if (isButton) {
      final Map<String, List<ClickData>> d =
          Map<String, List<ClickData>>.fromEntries(
        _clickButtonMap.entries.toList()
          ..sort(
            (MapEntry<String, List<ClickData>> a,
                    MapEntry<String, List<ClickData>> b) =>
                a.value.length.compareTo(b.value.length),
          ),
      );
      return d.keys.last;
    } else {
      final Map<String, List<ClickData>> d =
          Map<String, List<ClickData>>.fromEntries(
        _clickCauseMap.entries.toList()
          ..sort(
            (MapEntry<String, List<ClickData>> a,
                    MapEntry<String, List<ClickData>> b) =>
                a.value.length.compareTo(b.value.length),
          ),
      );
      return d.keys.last;
    }
  }

  ClickStat _serverDataStatistics(Statistics stats) {
    int maxValue = -1;
    int totalClicks = 0;
    String buttonValue;
    String causeValue;
    for (final ButtonClickData data in stats.buttonClickData) {
      final int buttonClick = int.tryParse(data.total.toString());
      if (buttonClick > maxValue) {
        buttonValue = data.button;
        maxValue = buttonClick;
      }
      totalClicks += buttonClick;
    }
    maxValue = -1;

    for (final CauseClickData data in stats.causeClickData) {
      final int causeClick = int.tryParse(data.total.toString());
      if (causeClick > maxValue) {
        causeValue = data.cause;
        maxValue = causeClick;
      }
    }
    return ClickStat(
      (ClickStatBuilder b) => b
        ..mostClickedButton = buttonValue ?? '-'
        ..mostClickedCause = causeValue ?? '-'
        ..percentage = totalClicks.toString()
        ..totalClicks = totalClicks.toString(),
    );
  }

  String _percentageCalculator(
      int todayClickedCount, int yesterdayClickedCount) {
    if ((todayClickedCount == 0 && yesterdayClickedCount == 0) ||
        todayClickedCount == yesterdayClickedCount) {
      return '0%';
    } else if (todayClickedCount > yesterdayClickedCount) {
      if (yesterdayClickedCount == 0) {
        return '+${todayClickedCount * 100}%';
      } else {
        return '+${(((todayClickedCount - yesterdayClickedCount) / yesterdayClickedCount) * 100).toStringAsFixed(2)}%';
      }
    } else {
      if (todayClickedCount == 0) {
        return '-${yesterdayClickedCount * 100}%';
      } else {
        return '${(((todayClickedCount - yesterdayClickedCount) / todayClickedCount) * 100).toStringAsFixed(2)}%';
      }
    }
  }

  Stream<AppState> _userStats(GetUserStatsEvent event) async* {
    try {
      final UserStats stats = await _dataService.getUserStats(
          token: state.userDetails.token, id: state.userDetails.currentUser.id);
      if (stats == null) {
        throw Exception();
      } else {
        ClickStatistics clickStats =
            ClickStatistics((ClickStatisticsBuilder builder) => builder
              ..yesterday = _serverDataStatistics(stats.yesterday).toBuilder()
              ..today = _serverDataStatistics(stats.today).toBuilder()
              ..overall = _serverDataStatistics(stats.overall).toBuilder());
        clickStats = (clickStats.toBuilder()
              ..today.percentage = _percentageCalculator(
                int.tryParse(clickStats.today.percentage),
                int.tryParse(clickStats.yesterday.percentage),
              ))
            .build();
        yield (state.toBuilder()
              ..userStats = stats.toBuilder()
              ..clickStatistics =
                  (clickStats.toBuilder()..yesterday.percentage = '0'))
            .build();
      }
    } on Exception {
      final ClickDataList _dataList = _preferencesService.getClickData();
      if (_dataList != null) {
        final Map<String, List<ClickData>> mapData = groupBy<ClickData, String>(
          _dataList.clickDataList.toList(),
          (ClickData d) => d.clickedAt.split(' ').first,
        );
        final String yesterdayDate = DateTime.now()
            .toUtc()
            .subtract(
              const Duration(days: 1),
            )
            .toString()
            .split(' ')
            .first;
        final String todayDate =
            DateTime.now().toUtc().toString().split(' ').first;
        final ClickStat yesterdayStats =
            ClickStat((ClickStatBuilder builder) => builder
              ..mostClickedButton = mostClicked(
                mapData[yesterdayDate],
                true,
              )
              ..mostClickedCause = mostClicked(
                mapData[yesterdayDate],
                false,
              )
              ..percentage = '0');
        final int todayClickedCount = mapData[todayDate]?.length ?? 0;
        final int yesterdayClickedCount = mapData[yesterdayDate]?.length ?? 0;

        final ClickStat todayStats =
            ClickStat((ClickStatBuilder builder) => builder
              ..mostClickedButton = mostClicked(
                mapData[todayDate],
                true,
              )
              ..mostClickedCause = mostClicked(
                mapData[todayDate],
                false,
              )
              ..percentage = _percentageCalculator(
                todayClickedCount,
                yesterdayClickedCount,
              ));

        final ClickStat overallStats =
            ClickStat((ClickStatBuilder builder) => builder
              ..mostClickedButton = mostClicked(
                _dataList.clickDataList.toList(),
                true,
              )
              ..mostClickedCause = mostClicked(
                _dataList.clickDataList.toList(),
                false,
              )
              ..percentage = '0');

        final ClickStatistics clickStats =
            ClickStatistics((ClickStatisticsBuilder builder) => builder
              ..yesterday = yesterdayStats.toBuilder()
              ..today = todayStats.toBuilder()
              ..overall = overallStats.toBuilder());
        yield (state.toBuilder()..clickStatistics = clickStats.toBuilder())
            .build();
      } else
        yield (state.toBuilder()..clickStatistics = null).build();
    }
  }

  Stream<AppState> sendLocalData() async* {
    AppState state = this.state;
    final ClickDataList localData = _preferencesService.getClickData();
    if (localData != null) {
      final ClickDataListBuilder listDataBuilder = localData.toBuilder();
      if (localData.clickDataList.isNotEmpty) {
        final List<ClickData> unsentData = localData.clickDataList
            .where((ClickData data) => data.clickUnsent == true)
            .toList();

        if (unsentData.isNotEmpty) {
          final List<Map<String, dynamic>> body = <Map<String, dynamic>>[];
          for (final ClickData data in unsentData) {
            body.add(data.toJson());
          }
          final ReasonSubmitResponse result = await _dataService.submitReasons(
            token: _preferencesService.getUser().token,
            body: body,
          );
          if (result?.success ?? false) {
            if (result.user != null) {
              final SignInSuccess existingUserDetails =
                  _preferencesService.saveCurrentUser(user: result.user);
              await for (final AppState _state
                  in _afterLogin(existingUserDetails)) {
                state = _state;
                yield _state;
              }
            }
            final ListBuilder<ClickData> listBuilder =
                localData.clickDataList.toBuilder();
            for (int i = 0; i < localData.clickDataList.length; i++) {
              final ClickData data = listBuilder[i];
              if (data.clickUnsent) {
                final ClickDataBuilder dataBuilder = data.toBuilder();
                dataBuilder.clickUnsent = false;
                listBuilder[i] = dataBuilder.build();
              }
            }
            listDataBuilder.clickDataList = listBuilder;
          }
        }
      }
      _preferencesService.saveClickDataList(
          clickDataList: listDataBuilder.build());
    }
    yield state;
  }

  Stream<AppState> _userSubmitClick(UserSubmitClickEvent event) async* {
    final ReasonSubmitResponse result = await _dataService.submitReasons(
      token: state.userDetails.token,
      body: event.body.map((ClickData e) => e.toJson()).toList(),
    );
    final ClickData data = (event.body.first.toBuilder()
          ..clickUnsent = !(result?.success ?? false))
        .build();
    _preferencesService.saveClickData(clickData: data);
    if (result?.user != null ?? false) {
      final SignInSuccess existingUserDetails =
          _preferencesService.saveCurrentUser(user: result.user);
      yield* _afterLogin(existingUserDetails);
    }
  }

  Stream<AppState> _sendBtData(SendBTData event) async* {
    // final bool result =
    await _dataService.submitBtData(
      token: state.userDetails.token,
      data: event.data,
    );
  }

  Stream<AppState> _toggleSettings(ToggleSettingsEvent event) async* {
    yield (state.toBuilder()
          ..showNotifications = event.showNotifications
          ..playSounds = event.playSounds)
        .build();
  }
}
