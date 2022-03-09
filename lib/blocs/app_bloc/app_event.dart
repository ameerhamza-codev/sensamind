import 'dart:async';

import 'package:mindwatch/blocs/application_bloc.dart';
import 'package:mindwatch/models/click_data.dart';

abstract class AppEvent extends AppBlocEvent {}

class InitAppEvent extends AppEvent {}

class LoginEvent extends AppEvent {
  LoginEvent({this.email, this.password});

  final String email;

  final String password;
}

class SendBTData extends AppEvent {
  SendBTData(this.data);

  final List<Map<String, dynamic>> data;
}

class SignUpEvent extends AppEvent {
  SignUpEvent({
    this.name,
    this.email,
    this.password,
    this.zipCode,
  });

  final String name;

  final String email;

  final String password;

  final String zipCode;
}

class LogOutEvent extends AppEvent {
  LogOutEvent({this.email, this.authKey});

  final String email;

  final String authKey;
}

class UnlockAccountEvent extends AppEvent {
  UnlockAccountEvent({this.email});

  final String email;
}

class ForgotPasswordEvent extends AppEvent {
  ForgotPasswordEvent({this.email});

  final String email;
  final Completer<void> _completer = Completer<void>();

  Future<void> get future => _completer.future;

  void complete() {
    _completer.complete();
  }

  void completeError() {
    _completer.completeError(null);
  }
}

class ActivitySubmitEvent extends AppEvent {
  ActivitySubmitEvent({this.body});

  final Map<String, String> body;
}

class GetUserStatsEvent extends AppEvent {
  GetUserStatsEvent();
}

class UserSubmitClickEvent extends AppEvent {
  UserSubmitClickEvent({this.token, this.body});

  final String token;

  final List<ClickData> body;
}

class ToggleSettingsEvent extends AppEvent {
  ToggleSettingsEvent({this.showNotifications, this.playSounds});

  final bool showNotifications;
  final bool playSounds;
}
