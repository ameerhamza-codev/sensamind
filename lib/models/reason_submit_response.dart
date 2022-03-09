import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mindwatch/models/app_user.dart';
import 'package:mindwatch/models/serializers.dart';

part 'reason_submit_response.g.dart';

abstract class ReasonSubmitResponse
    implements Built<ReasonSubmitResponse, ReasonSubmitResponseBuilder> {
  ReasonSubmitResponse._();

  factory ReasonSubmitResponse(
          [void Function(ReasonSubmitResponseBuilder) updates]) =
      _$ReasonSubmitResponse;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ReasonSubmitResponse.serializer, this) as Map<String,dynamic>;
  }

  static ReasonSubmitResponse fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ReasonSubmitResponse.serializer, json);
  }

  static Serializer<ReasonSubmitResponse> get serializer =>
      _$reasonSubmitResponseSerializer;

  bool get success;

  String get message;

  @nullable
  AppUser get user;
}
