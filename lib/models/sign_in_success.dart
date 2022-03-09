import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mindwatch/models/app_user.dart';
import 'package:mindwatch/models/serializers.dart';

part 'sign_in_success.g.dart';

abstract class SignInSuccess
    implements Built<SignInSuccess, SignInSuccessBuilder> {
  factory SignInSuccess([void Function(SignInSuccessBuilder) updates]) =
  _$SignInSuccess;
  SignInSuccess._();



  Map<String, dynamic> toJson() {
    return serializers.serializeWith(SignInSuccess.serializer, this)
        as Map<String, dynamic>;
  }

  static SignInSuccess fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(SignInSuccess.serializer, json);
  }

  static Serializer<SignInSuccess> get serializer => _$signInSuccessSerializer;

  @BuiltValueField()
  bool get success;

  @BuiltValueField()
  String get token;

  @BuiltValueField(wireName: 'user')
  AppUser get currentUser;

  @BuiltValueField(wireName: 'expires_in')
  int get expiresIn;
}
