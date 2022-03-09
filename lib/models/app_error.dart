import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mindwatch/models/serializers.dart';

part 'app_error.g.dart';

abstract class AppError implements Built<AppError, AppErrorBuilder> {
  factory AppError([void Function(AppErrorBuilder) updates]) = _$AppError;

  AppError._();

  static AppError fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AppError.serializer, json);
  }

  static Serializer<AppError> get serializer => _$appErrorSerializer;

  @nullable
  @BuiltValueField()
  bool get success;

  @BuiltValueField()
  Error get error;
}

abstract class Error implements Built<Error, ErrorBuilder> {
  factory Error([void Function(ErrorBuilder) updates]) = _$Error;

  Error._();

  static Error fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Error.serializer, json);
  }

  static Serializer<Error> get serializer => _$errorSerializer;

  @BuiltValueField()
  String get message;

  String get allMessage =>
      errors?.values?.join('\n') ?? 'Something went wrong!';

  @nullable
  BuiltMap<String, BuiltList<String>> get errors;
}
