import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mindwatch/models/serializers.dart';

part 'user_sign_up.g.dart';

abstract class UserSignUp implements Built<UserSignUp, UserSignUpBuilder> {
  factory UserSignUp([void Function(UserSignUpBuilder) updates]) = _$UserSignUp;

  UserSignUp._();

  static UserSignUp fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserSignUp.serializer, json);
  }

  static Serializer<UserSignUp> get serializer => _$userSignUpSerializer;

  @BuiltValueField()
  bool get success;

  @BuiltValueField()
  String get message;
}
