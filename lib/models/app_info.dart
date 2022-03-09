import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mindwatch/models/serializers.dart';

part 'app_info.g.dart';

abstract class AppInfo implements Built<AppInfo, AppInfoBuilder> {
  factory AppInfo([void Function(AppInfoBuilder) updates]) = _$AppInfo;

  AppInfo._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AppInfo.serializer, this)
        as Map<String, dynamic>;
  }

  static AppInfo fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AppInfo.serializer, json);
  }

  static Serializer<AppInfo> get serializer => _$appInfoSerializer;

  @BuiltValueField()
  bool get success;

  @BuiltValueField(wireName: 'user')
  UserDetails get userDetails;
}

abstract class UserDetails implements Built<UserDetails, UserDetailsBuilder> {
  factory UserDetails([void Function(UserDetailsBuilder) updates]) =
      _$UserDetails;

  UserDetails._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(UserDetails.serializer, this)
        as Map<String, dynamic>;
  }

  static UserDetails fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserDetails.serializer, json);
  }

  static Serializer<UserDetails> get serializer => _$userDetailsSerializer;
  // Repetitive details which are received in login have been ignored

  int get id;

  @BuiltValueField(wireName: 'user_group')
  UserGroup get userGroup;
  @BuiltValueField(wireName: 'button_one')
  ButtonDetails get buttonOneDetails;

  @BuiltValueField(wireName: 'button_two')
  ButtonDetails get buttonTwoDetails;
}

abstract class UserGroup implements Built<UserGroup, UserGroupBuilder> {
  factory UserGroup([void Function(UserGroupBuilder) updates]) = _$UserGroup;

  UserGroup._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(UserGroup.serializer, this)
        as Map<String, dynamic>;
  }

  static UserGroup fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserGroup.serializer, json);
  }

  static Serializer<UserGroup> get serializer => _$userGroupSerializer;

  int get id;

  String get name;

  String get description;
}

abstract class ButtonDetails
    implements Built<ButtonDetails, ButtonDetailsBuilder> {
  factory ButtonDetails([void Function(ButtonDetailsBuilder) updates]) =
      _$ButtonDetails;

  ButtonDetails._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ButtonDetails.serializer, this)
        as Map<String, dynamic>;
  }

  static ButtonDetails fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ButtonDetails.serializer, json);
  }

  static Serializer<ButtonDetails> get serializer => _$buttonDetailsSerializer;

  int get id;

  @BuiltValueField(wireName: 'button_label')
  String get buttonLabel;

  String get cause1;

  String get cause2;

  String get cause3;

  String get cause4;

  String get cause5;
}
