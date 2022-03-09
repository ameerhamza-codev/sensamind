import 'dart:convert';

import 'package:mindwatch/models/app_info.dart';
import 'package:mindwatch/models/app_user.dart';
import 'package:mindwatch/models/click_data.dart';
import 'package:mindwatch/models/sign_in_success.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  const PreferencesService({this.client});

  final SharedPreferences client;

  static const String _appUserKey = 'appUser';
  static const String _appQuestionsKey = 'questions';
  static const String _clickData = 'clickData';

  SignInSuccess getUser() {
    final String userString = client.getString(_appUserKey);
    if (userString == null) {
      return null;
    }
    return SignInSuccess.fromJson(
        json.decode(userString) as Map<String, dynamic>);
  }

  void saveUser({SignInSuccess userDetails}) {
    if (userDetails == null) {
      client.setString(_appUserKey, null);
      return;
    }
    client.setString(_appUserKey, json.encode(userDetails.toJson()));
  }

  SignInSuccess saveCurrentUser({AppUser user}) {
    SignInSuccess existingUserDetails = getUser();
    existingUserDetails = (existingUserDetails.toBuilder()
          ..currentUser = user?.toBuilder())
        .build();
    return existingUserDetails;
  }

  AppInfo getQuestions() {
    final String questionsString = client.getString(_appQuestionsKey);
    if (questionsString == null) {
      return null;
    }
    return AppInfo.fromJson(
        json.decode(questionsString) as Map<String, dynamic>);
  }

  void saveQuestions({AppInfo info}) {
    if (info == null) {
      client.setString(_appQuestionsKey, null);
      return;
    }
    client.setString(_appQuestionsKey, json.encode(info.toJson()));
  }

  ClickDataList getClickData() {
    final String clickDataString = client.getString(_clickData);
    print(clickDataString);
    if (clickDataString != null)
      return ClickDataList.fromJson(
          json.decode(clickDataString) as Map<String, dynamic>);
    else
      return null;
  }

  void saveClickDataList({ClickDataList clickDataList}) {
    if (clickDataList == null) {
      client.setString(_clickData, null);
      return;
    }
    client.setString(_clickData, json.encode(clickDataList.toJson()));
  }

  void saveClickData({ClickData clickData}) {
    if (clickData == null) {
      client.setString(_clickData, null);
      return;
    }
    ClickDataList _dataList = getClickData();
    if (_dataList == null) {
      _dataList =
          (ClickDataList().toBuilder()..clickDataList.add(clickData)).build();
    } else {
      _dataList = (_dataList.toBuilder()..clickDataList.add(clickData)).build();
    }

    client.setString(_clickData, json.encode(_dataList.toJson()));
    print(_dataList.toJson());
  }
}
