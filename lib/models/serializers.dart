import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:mindwatch/blocs/app_bloc/app_state.dart';
import 'package:mindwatch/models/activity_submit_result.dart';
import 'package:mindwatch/models/app_error.dart';
import 'package:mindwatch/models/app_info.dart';
import 'package:mindwatch/models/app_user.dart';
import 'package:mindwatch/models/bt_click_data.dart';
import 'package:mindwatch/models/click_data.dart';
import 'package:mindwatch/models/click_statistics.dart';
import 'package:mindwatch/models/forgot_password.dart';
import 'package:mindwatch/models/reason_submit_response.dart';
import 'package:mindwatch/models/sign_in_success.dart';
import 'package:mindwatch/models/user_sign_up.dart';
import 'package:mindwatch/models/user_stats.dart';
import 'package:mindwatch/models/user_unlock.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  AppState,
  AppUser,
  AppError,
  UserSignUp,
  UserUnlock,
  SignInSuccess,
  AppInfo,
  ForgotPassword,
  UserStats,
  Statistics,
  ButtonClickData,
  CauseClickData,
  ClickDataList,
  ClickStatistics,
  BtClickData,
  ReasonSubmitResponse,
  ActivitySubmitResult,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => ListBuilder<String>()))
    .build();
