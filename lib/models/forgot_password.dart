import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mindwatch/models/serializers.dart';

part 'forgot_password.g.dart';

abstract class ForgotPassword
    implements Built<ForgotPassword, ForgotPasswordBuilder> {
  factory ForgotPassword([void Function(ForgotPasswordBuilder) updates]) =
      _$ForgotPassword;

  ForgotPassword._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ForgotPassword.serializer, this)
        as Map<String, dynamic>;
  }

  static ForgotPassword fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ForgotPassword.serializer, json);
  }

  static Serializer<ForgotPassword> get serializer =>
      _$forgotPasswordSerializer;

  @BuiltValueField()
  bool get success;

  @BuiltValueField()
  String get message;
}
