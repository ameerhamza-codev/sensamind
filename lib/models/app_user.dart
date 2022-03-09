import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mindwatch/models/serializers.dart';

part 'app_user.g.dart';

abstract class AppUser implements Built<AppUser, AppUserBuilder> {
  factory AppUser([void Function(AppUserBuilder) updates]) = _$AppUser;

  AppUser._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AppUser.serializer, this)
        as Map<String, dynamic>;
  }

  static AppUser fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AppUser.serializer, json);
  }

  static Serializer<AppUser> get serializer => _$appUserSerializer;

  @BuiltValueField()
  int get id;

  @BuiltValueField()
  String get name;

  @BuiltValueField()
  String get email;

  @BuiltValueField(wireName: 'zipcode')
  String get zipCode;

  @BuiltValueField()
  @nullable
  int get age;

  @BuiltValueField()
  @nullable
  int get gender;

  @BuiltValueField()
  @nullable
  String get argued;

  @BuiltValueField(wireName: 'current_evolution')
  @nullable
  int get currentEvolution;
}
