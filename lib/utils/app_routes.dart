import 'package:mindwatch/utils/app_navigator.dart';

// ignore: avoid_classes_with_only_static_members
class AppRoutes {
  static const String _initPage = '/';
  static const String _splashScreen = '/splashScreen';
  static const String _home = '/home/{agr1}';
  static const String _signIn = '/signIn';
  static const String _signUp = '/signUp';
  static const String _forgotPassword = '/forgotPassword';
  static const String _resetPasswordSubmitted = '/resetPasswordSubmitted';
  static const String _registrationSuccessful = '/registrationSuccessful';
  static const String _unlockUser = '/unlockUser';
  static const String _signInActivity1 = '/signInActivity1';
  static const String _signInActivity2 = '/signInActivity2';
  static const String _activityCompleted = '/activityCompleted';
  static const String _help = '/help';
  static const String _statistics = '/statistics';
  static const String _chat = '/chat';
  static const String _settings = '/settings';
  static const String _bleHome = '/bleHome';

  static AppRoute splashScreen = AppRoute(path: _splashScreen);
  static AppRoute initPage = AppRoute(path: _initPage);
  static AppRoute bleHome = AppRoute(path: _bleHome);
  static AppRoute home = AppRoute(path: _home);
  static AppRoute signIn = AppRoute(path: _signIn);
  static AppRoute signUp = AppRoute(path: _signUp);
  static AppRoute forgotPassword = AppRoute(path: _forgotPassword);
  static AppRoute resetPasswordSubmitted =
      AppRoute(path: _resetPasswordSubmitted);
  static AppRoute registrationSuccessful =
      AppRoute(path: _registrationSuccessful);
  static AppRoute signInActivity1 = AppRoute(path: _signInActivity1);
  static AppRoute signInActivity2 = AppRoute(path: _signInActivity2);
  static AppRoute unlockUser = AppRoute(path: _unlockUser);
  static AppRoute help = AppRoute(path: _help);
  static AppRoute statistics = AppRoute(path: _statistics);
  static AppRoute settings = AppRoute(path: _settings);
  static AppRoute chat = AppRoute(path: _chat);
  static AppRoute activityCompleted = AppRoute(path: _activityCompleted);

  static AppRoute getRouteForPath(String path) {
    return AppRoute(path: path);
  }
}
