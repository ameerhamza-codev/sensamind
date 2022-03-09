import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindwatch/blocs/app_bloc/app_bloc.dart';
import 'package:mindwatch/blocs/app_bloc/app_state.dart';
import 'package:mindwatch/data/api_service.dart';
import 'package:mindwatch/data/ble_service.dart';
import 'package:mindwatch/data/notification_service.dart';
import 'package:mindwatch/intl/app_strings.dart';
import 'package:mindwatch/utils/app_navigator.dart';
import 'package:mindwatch/utils/app_routes.dart';
import 'package:mindwatch/utils/app_theme.dart';
import 'package:mindwatch/views/app_drawer_views/chat_page.dart';
import 'package:mindwatch/views/app_drawer_views/help_page.dart';
import 'package:mindwatch/views/app_drawer_views/settings_page.dart';
import 'package:mindwatch/views/app_drawer_views/statistics_page.dart';
import 'package:mindwatch/views/ble/ble_home.dart';
import 'package:mindwatch/views/forgot_password_views/email_submitted_page.dart';
import 'package:mindwatch/views/forgot_password_views/forgot_password_page.dart';
import 'package:mindwatch/views/home_views/home_page.dart';
import 'package:mindwatch/views/init_page.dart';
import 'package:mindwatch/views/sign_in_views/activity_completed_page.dart';
import 'package:mindwatch/views/sign_in_views/sign_in_activity_1.dart';
import 'package:mindwatch/views/sign_in_views/sign_in_activity_2.dart';
import 'package:mindwatch/views/sign_in_views/sign_in_page.dart';
import 'package:mindwatch/views/sign_in_views/unlock_user_page.dart';
import 'package:mindwatch/views/sign_up_views/registration_successful_page.dart';
import 'package:mindwatch/views/sign_up_views/sign_up_page.dart';
import 'package:mindwatch/views/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/preferences_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final ApiService apiService = ApiService(
    host: 'api.sensamind.com',
    scheme: 'http',
    scope: '/api',
  );
  final NotificationService notificationService = NotificationService();
  await notificationService.init();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final PreferencesService preferencesService = PreferencesService(
    client: prefs,
  );
  final BLEService bleService = BLEService();
  runApp(
    SensaMind(
      apiService: apiService,
      preferencesService: preferencesService,
      bleService: bleService,
      notificationService: notificationService,
    ),
//    DevicePreview(
//      enabled: true,
//      usePreferences: false,
//      areSettingsEnabled: true,
//      builder: (BuildContext context) =>
//    ),
  );
}

Map<AppRoute, AppRouteHandler> getRouteMap() {
  final Map<AppRoute, AppRouteHandler> routeMap = <AppRoute, AppRouteHandler>{
    AppRoutes.initPage: (BuildContext context, Map<String, String> params) {
      return InitPage();
    },
    AppRoutes.bleHome: (BuildContext context, Map<String, String> params) {
      return BLEHome();
    },
    AppRoutes.splashScreen: (BuildContext context, Map<String, String> params) {
      return SplashScreen();
    },
    AppRoutes.home: (BuildContext context, Map<String, String> params) {
      return HomePage();
    },
    AppRoutes.signIn: (BuildContext context, Map<String, String> params) {
      return SignInPage();
    },
    AppRoutes.signUp: (BuildContext context, Map<String, String> params) {
      return SignUpPage();
    },
    AppRoutes.forgotPassword:
        (BuildContext context, Map<String, String> params) {
      return ForgotPasswordPage();
    },
    AppRoutes.resetPasswordSubmitted:
        (BuildContext context, Map<String, String> params) {
      return ResetPasswordSubmittedPage();
    },
    AppRoutes.registrationSuccessful:
        (BuildContext context, Map<String, String> params) {
      return RegistrationSuccessfulPage();
    },
    AppRoutes.signInActivity1:
        (BuildContext context, Map<String, String> params) {
      return SignInActivity1(
        age: ModalRoute.of(context).settings.arguments.toString(),
      );
    },
    AppRoutes.signInActivity2:
        (BuildContext context, Map<String, String> params) {
      final Map<String, String> args =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      return SignInActivity2(
        age: args['age'],
        gender: args['gender'],
      );
    },
    AppRoutes.activityCompleted:
        (BuildContext context, Map<String, String> params) {
      return ActivityCompletedPage();
    },
    AppRoutes.unlockUser: (BuildContext context, Map<String, String> params) {
      return UnlockUserPage();
    },
    AppRoutes.statistics: (BuildContext context, Map<String, String> params) {
      return StatisticsPage();
    },
    AppRoutes.help: (BuildContext context, Map<String, String> params) {
      return HelpPage();
    },
    AppRoutes.chat: (BuildContext context, Map<String, String> params) {
      return ChatPage();
    },
    AppRoutes.settings: (BuildContext context, Map<String, String> params) {
      return SettingsPage();
    },
  };

  return routeMap;
}

class SensaMind extends StatefulWidget {
  const SensaMind({
    Key key,
    this.apiService,
    this.preferencesService,
    this.notificationService,
    this.bleService,
  }) : super(key: key);

  final ApiService apiService;
  final BLEService bleService;
  final PreferencesService preferencesService;
  final NotificationService notificationService;

  @override
  _SensaMindState createState() => _SensaMindState();
}

class _SensaMindState extends State<SensaMind> {
  static const double _baseWidth = 400;

  @override
  void initState() {
    super.initState();
    widget.notificationService.requestPermissions();
  }

  @override
  void dispose() {
    widget.notificationService.didReceiveLocalNotificationSubject.close();
    widget.notificationService.selectNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (BuildContext context) => AppBloc(
        initialState: AppState.initState(),
        dataService: widget.apiService,
        prefs: widget.preferencesService,
        bleService: widget.bleService,
      ),
      child: MaterialApp(
        theme: appTheme,
        locale: AppStrings.english,
        localizationsDelegates: AppStrings.delegates,
        supportedLocales: AppStrings.supportedLocales,
        onGenerateRoute: AppRouter(routeMap: getRouteMap()).onGenerateRoute,
        builder: (BuildContext context, Widget child) {
          final MediaQueryData mediaQuery = MediaQuery.of(context);
          return MediaQuery(
            data: mediaQuery.copyWith(
              textScaleFactor: mediaQuery.size.width / _baseWidth,
            ),
            child: child,
          );
        },
      ),
    );
  }
}
