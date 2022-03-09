import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mindwatch/utils/app_logger.dart';

typedef AppRouteHandler = Widget Function(
  BuildContext context,
  Map<String, String> params,
);

class AppRoute {
  AppRoute({
    @required this.path,
    this.fullScreenDialog = false,
    this.maintainState = true,
  })  : pattern = RegExp(
            '${path == '/' ? r'^/$' : '^${path.replaceAll(variablePattern, r'(.*[^/])')}\$'}'),
        log = AppLogger(tag: 'AppRoute');

  static RegExp variablePattern = RegExp(r'{(\w+)}');
  final String path;
  final RegExp pattern;
  final bool fullScreenDialog;
  final bool maintainState;
  final AppLogger log;

  Map<String, String> getParams(String url) {
    final RegExp pathPattern =
        RegExp(path.replaceAll(variablePattern, variablePattern.pattern));
    final Match key = pathPattern.firstMatch(path);
    final Match value = pattern.firstMatch(url);
    final Map<String, String> params = <String, String>{};
    for (int i = 1; i <= key.groupCount; i++) {
      params[key.group(i)] = value.group(i);
    }
    log.d('Path: $path ---> Params: $params');
    return params.isEmpty ? null : params;
  }

  String withArguments(List<String> arguments) {
    if (arguments == null) {
      return path;
    }
    String newPath = path;
    final List<Match> matches = variablePattern.allMatches(path).toList();
    if (matches.length > arguments.length) {
      throw Exception('Route variables and argument count mismatch');
    }
    for (int i = 0; i < matches.length; i++) {
      newPath = newPath.replaceFirst(variablePattern, arguments[i]);
    }
    return newPath;
  }
}

class AppRouter {
  AppRouter({@required this.routeMap}) : routes = routeMap.keys.toList();

  final Map<AppRoute, AppRouteHandler> routeMap;
  final List<AppRoute> routes;
  final AppLogger log = AppLogger(tag: 'AppRouter');

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final AppRoute route = routes.firstWhere(
      (AppRoute route) {
        return route.pattern.hasMatch(settings.name) ||
            route.path == settings.name;
      },
      orElse: () => null,
    );

    if (route == null) {
      throw Exception('Route Not Found');
    }

    final RouteSettings routeSettings = settings;
    final Map<String, String> params =
        route.path == settings.name ? null : route.getParams(settings.name);

    return MaterialPageRoute<dynamic>(
      fullscreenDialog: route.fullScreenDialog,
      settings: routeSettings,
      maintainState: route.maintainState,
      builder: (BuildContext context) {
        return routeMap[route](context, params);
      },
    );
  }
}
