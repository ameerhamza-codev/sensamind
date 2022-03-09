import 'package:flutter/material.dart';
import 'package:mindwatch/models/reason_submit_response.dart';
import 'package:mindwatch/models/user_stats.dart';
import 'package:mindwatch/models/user_unlock.dart';

abstract class DataService {
  Future<String> authenticate({
    @required String username,
    @required String password,
  });

  Future<bool> logOut({
    @required String email,
    @required String authKey,
  });

  Future<String> updateQuestions({
    @required String email,
    @required String token,
  });

  Future<String> activitySubmission({
    @required String token,
    @required Map<String, String> body,
  });

  Future<UserStats> getUserStats({
    @required String token,
    @required int id,
  });

  Future<UserUnlock> unlockUser({String email});

  Future<String> signUp({Map<String, String> body});

  Future<ReasonSubmitResponse> submitReasons({
    @required String token,
    @required List<Map<String, dynamic>> body,
  });

  Future<String> forgotPassword({String email});

  Future<bool> submitBtData({String token, List<Map<String, dynamic>> data});
}
