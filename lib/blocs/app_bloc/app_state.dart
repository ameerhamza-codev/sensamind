import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mindwatch/blocs/application_bloc.dart';
import 'package:mindwatch/models/app_info.dart';
import 'package:mindwatch/models/click_statistics.dart';
import 'package:mindwatch/models/sign_in_success.dart';
import 'package:mindwatch/models/user_stats.dart';

part 'app_state.g.dart';

abstract class AppState
    implements Built<AppState, AppStateBuilder>, AppBlocState {
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  AppState._();

  static AppState initState() => AppState((AppStateBuilder b) {
        b
          ..loading = true
          ..initializing = true
          ..isAuthenticated = false
          ..isRegistered = false
          ..isLocked = false
          ..isSetupCompleted = false
          ..playSounds = true
          ..showNotifications = true
          ..exceptionMessage = null;
      });

  static Serializer<AppState> get serializer => _$appStateSerializer;

  bool get initializing;

  bool get isAuthenticated;

  bool get isRegistered;

  bool get isLocked;

  bool get isSetupCompleted;

  bool get playSounds;

  bool get showNotifications;

  @nullable
  SignInSuccess get userDetails;

  @nullable
  UserStats get userStats;

  @nullable
  ClickStatistics get clickStatistics;

  @nullable
  AppInfo get appInfo;

  @nullable
  String get exceptionMessage;
}
