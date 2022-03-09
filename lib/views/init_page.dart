import 'package:flutter/material.dart';
import 'package:mindwatch/connectors/app_connector.dart';
import 'package:mindwatch/data/notification_service.dart';
import 'package:mindwatch/views/app_drawer_views/chat_page.dart';
import 'package:mindwatch/views/app_drawer_views/settings_page.dart';
import 'package:mindwatch/views/app_drawer_views/statistics_page.dart';
import 'package:mindwatch/views/home_views/home_page.dart';
import 'package:mindwatch/views/sign_in_views/activity_started_page.dart';
import 'package:mindwatch/views/sign_in_views/sign_in_page.dart';
import 'package:mindwatch/views/splash_screen.dart';

class InitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppConnector(
      builder: (BuildContext context, AppViewModel model) {
        return _InitPage(model);
      },
    );
  }
}

class _InitPage extends StatefulWidget {
  const _InitPage(this.model) : assert(model != null);

  final AppViewModel model;

  @override
  __InitPageState createState() => __InitPageState();
}

class __InitPageState extends State<_InitPage> {
  @override
  void initState() {
    super.initState();
    model.init();
    NotificationService().scheduleDailyNotification();
  }

  @override
  void didUpdateWidget(_InitPage old) {
    super.didUpdateWidget(old);
    if (old.model != widget.model) {
      setState(() {});
    }
  }

  AppViewModel get model => widget.model;

  @override
  Widget build(BuildContext context) {
    if (model.isInitializing) {
      return SplashScreen();
    } else if (!model.isSetupCompleted && model.currentUserDetails != null) {
      return ActivityStartedPage();
    } else if (model.isAuthenticated) {
      return Home();
    }
    return SignInPage();
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: <Widget>[
            HomePage(),
            StatisticsPage(),
            ChatPage(),
            SettingsPage(),
          ][_index],
        ),
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (int i) {
            setState(() {
              _index = i;
            });
          },
          currentIndex: _index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              label: 'Statistics',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ],
    );
  }
}
