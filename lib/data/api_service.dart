import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:meta/meta.dart';
import 'package:mindwatch/data/data_service.dart';
import 'package:mindwatch/models/reason_submit_response.dart';
import 'package:mindwatch/models/user_stats.dart';
import 'package:mindwatch/models/user_unlock.dart';

class MyHTTPClient extends IOClient {
  @override
  Future<IOStreamedResponse> send(http.BaseRequest request) {
    return super.send(request);
  }
}

//class ApiError extends Error {}
// ignore: avoid_classes_with_only_static_members
class ApiRoutes {
  static const String signIn = 'auth/signin';
  static const String logOut = 'auth/logout';
  static const String signUp = 'auth/signup';
  static const String forgotPassword = 'auth/forgot-password';
  static const String unlockAccount = 'auth/unlock-account';
  static const String getUserInfo = 'user';
  static const String updateUser = 'user';
  static const String submitUserClicks = 'user/click';
  static const String fcmApi = 'admin/register-device-token';
  static const String submitBtClicks = 'user/bluetooth/click';

  static const String getClickStatistics = 'user/statistics';
}

class ApiService implements DataService {
  ApiService({
    @required this.scheme,
    @required this.host,
    this.port,
    this.scope,
  }) : assert(scheme != null && host != null,
            'Scheme, host and httpclient cannot be null');

  final String scheme;
  final String host;
  final int port;
  final String scope;
  static const String _apiFailureResponse = '"result":false';

  @override
  String toString() {
    return '$scheme://$host${port == null ? '' : '$port'}$scope';
  }

  String _buildUrl(String path, {Map<String, String> queryParams}) {
    return Uri(
      scheme: scheme,
      host: host,
      port: port,
      path: '$scope/$path',
      queryParameters: queryParams,
    ).toString();
  }

  @override
  Future<String> authenticate({String username, String password}) async {
    http.Response response;
    final Map<String, String> _body = <String, String>{
      'email': username,
      'password': password
    };
    try {
      final String url = _buildUrl(ApiRoutes.signIn);
      response = await http.post(
        url,
        body: _body,
      );
    } on SocketException catch (error) {
      print(error);
    }
    final dynamic res = response.body;
    final dynamic data = json.decode(res as String);
    final Map<String, dynamic> newData = <String, dynamic>{
      'success': data['success'],
      'token': data['token'],
      'user': data['user'],
      'expires_in': data['expires_in'].toString(),
    };
    return json.encode(newData);
  }

  @override
  Future<bool> logOut({String email, String authKey}) async {
    http.Response response;
    final Map<String, String> _body = <String, String>{
      'email': email,
      'auth_key': authKey,
    };
    try {
      final String url = _buildUrl(ApiRoutes.logOut);
      response = await http.post(
        url,
        body: _body,
      );
    } on SocketException catch (error) {
      print(error);
      return false;
    }
    print(response.body);
    if (response.body.contains('"result":"true"'))
      return true;
    else
      return false;
  }

  @override
  Future<String> signUp({Map<String, String> body}) async {
    http.Response response;

    try {
      final String url = _buildUrl(ApiRoutes.signUp);
      response = await http.post(
        url,
        body: body,
      );
    } on SocketException catch (error) {
      print(error);
    }
    print(response.body);
    return response.body;
  }

  @override
  Future<UserUnlock> unlockUser({String email}) async {
    http.Response response;
    final Map<String, String> _body = <String, String>{
      'email': email,
    };
    try {
      final String url = _buildUrl(ApiRoutes.unlockAccount);
      response = await http.post(
        url,
        body: _body,
      );
    } on SocketException catch (error) {
      print(error);
    }
    print(response.body);
    return UserUnlock.fromJson(
        json.decode(response.body) as Map<String, dynamic>);
  }

  @override
  Future<String> forgotPassword({String email}) async {
    http.Response response;
    final Map<String, String> _body = <String, String>{
      'email': email,
    };
    try {
      final String url = _buildUrl(ApiRoutes.forgotPassword);
      response = await http.post(
        url,
        body: _body,
      );
    } on SocketException catch (error) {
      print(error);
    }
    print(response.body);
    return response.body;
  }

  @override
  Future<String> updateQuestions({String email, String token}) async {
    http.Response response;
    try {
      final String url = _buildUrl(ApiRoutes.getUserInfo);
      response = await http.get(
        url,
        headers: <String, String>{'authorization': 'Bearer $token'},
      );
    } on SocketException {
      print('error');
      return null;
    }
    print(response.body);

    return response.body;
  }

  @override
  Future<String> activitySubmission({
    String token,
    Map<String, String> body,
  }) async {
    http.Response response;
    try {
      final String url = _buildUrl(ApiRoutes.updateUser);
      response = await http.put(
        url,
        headers: <String, String>{
          'authorization': 'Bearer $token',
        },
        body: body,
      );
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      return null;
    }
    print(response.body);

    return response.body;
  }

  @override
  Future<UserStats> getUserStats({String token, int id}) async {
    http.Response response;

    try {
      final String url =
          _buildUrl(ApiRoutes.getClickStatistics, queryParams: <String, String>{
        'id': '$id',
      });
      response = await http.get(
        url,
        headers: <String, String>{
          'authorization': 'Bearer $token',
        },
      );
    } on SocketException {
      print('No Internet');
      return null;
    }
    print(response.body);

    return UserStats.fromJson(
        json.decode(response.body) as Map<String, dynamic>);
  }

  @override
  Future<ReasonSubmitResponse> submitReasons({
    String token,
    List<Map<String, dynamic>> body,
  }) async {
    http.Response response;
    final Map<String, dynamic> _body = <String, dynamic>{
      'clicks': body,
    };
    print(json.encode(_body));
    try {
      final String url = _buildUrl(ApiRoutes.submitUserClicks);
      response = await http.post(
        url,
        headers: <String, String>{
          'authorization': 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: json.encode(_body),
      );
    } on SocketException {
      print('No Internet');
      return null;
    }
    print(response.body);
    return ReasonSubmitResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>);
  }

  @override
  Future<bool> submitBtData({String token, List<Map<String, dynamic>> data}) async {
    print("data bbbat $data");
    http.Response response;
    try {
      final String url = _buildUrl(ApiRoutes.submitBtClicks);
      response = await http.post(
        url,
        headers: <String, String>{
          'authorization': 'Bearer $token',
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: json.encode(<String, dynamic>{'clicks': data}),
      );
    } catch (error, stacktrace) {
      print('$error=>$stacktrace');
      return false;
    }
    //print(response.body);
    if (response.body.contains(_apiFailureResponse))
      return false;
    else
      return true;
  }
}
