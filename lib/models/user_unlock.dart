import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mindwatch/models/serializers.dart';

part 'user_unlock.g.dart';

abstract class UserUnlock implements Built<UserUnlock, UserUnlockBuilder> {
  factory UserUnlock([void Function(UserUnlockBuilder) updates]) = _$UserUnlock;

  UserUnlock._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(UserUnlock.serializer, this)
        as Map<String, dynamic>;
  }

  static UserUnlock fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserUnlock.serializer, json);
  }

  static Serializer<UserUnlock> get serializer => _$userUnlockSerializer;

  @BuiltValueField()
  String get result;

  @BuiltValueField()
  @nullable
  String get email;
}
