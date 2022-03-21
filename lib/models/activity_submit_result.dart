import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mindwatch/models/app_user.dart';
import 'package:mindwatch/models/serializers.dart';

part 'activity_submit_result.g.dart';

abstract class ActivitySubmitResult
    implements Built<ActivitySubmitResult, ActivitySubmitResultBuilder> {
  factory ActivitySubmitResult(
          [void Function(ActivitySubmitResultBuilder) updates]) =
      _$ActivitySubmitResult;

  ActivitySubmitResult._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ActivitySubmitResult.serializer, this)
        as Map<String, dynamic>;
  }

  static ActivitySubmitResult fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ActivitySubmitResult.serializer, json);
  }

  static Serializer<ActivitySubmitResult> get serializer =>
      _$activitySubmitResultSerializer;

  @nullable
  bool get success;

  @nullable
  String get message;

  @nullable
  AppUser get user;
}
