// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_submit_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ActivitySubmitResult> _$activitySubmitResultSerializer =
    new _$ActivitySubmitResultSerializer();

class _$ActivitySubmitResultSerializer
    implements StructuredSerializer<ActivitySubmitResult> {
  @override
  final Iterable<Type> types = const [
    ActivitySubmitResult,
    _$ActivitySubmitResult
  ];
  @override
  final String wireName = 'ActivitySubmitResult';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ActivitySubmitResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.success != null) {
      result
        ..add('success')
        ..add(serializers.serialize(object.success,
            specifiedType: const FullType(bool)));
    }
    if (object.message != null) {
      result
        ..add('message')
        ..add(serializers.serialize(object.message,
            specifiedType: const FullType(String)));
    }
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(AppUser)));
    }
    return result;
  }

  @override
  ActivitySubmitResult deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActivitySubmitResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(AppUser)) as AppUser);
          break;
      }
    }

    return result.build();
  }
}

class _$ActivitySubmitResult extends ActivitySubmitResult {
  @override
  final bool success;
  @override
  final String message;
  @override
  final AppUser user;

  factory _$ActivitySubmitResult(
          [void Function(ActivitySubmitResultBuilder) updates]) =>
      (new ActivitySubmitResultBuilder()..update(updates)).build();

  _$ActivitySubmitResult._({this.success, this.message, this.user}) : super._();

  @override
  ActivitySubmitResult rebuild(
          void Function(ActivitySubmitResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActivitySubmitResultBuilder toBuilder() =>
      new ActivitySubmitResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivitySubmitResult &&
        success == other.success &&
        message == other.message &&
        user == other.user;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, success.hashCode), message.hashCode), user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ActivitySubmitResult')
          ..add('success', success)
          ..add('message', message)
          ..add('user', user))
        .toString();
  }
}

class ActivitySubmitResultBuilder
    implements Builder<ActivitySubmitResult, ActivitySubmitResultBuilder> {
  _$ActivitySubmitResult _$v;

  bool _success;
  bool get success => _$this._success;
  set success(bool success) => _$this._success = success;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  AppUserBuilder _user;
  AppUserBuilder get user => _$this._user ??= new AppUserBuilder();
  set user(AppUserBuilder user) => _$this._user = user;

  ActivitySubmitResultBuilder();

  ActivitySubmitResultBuilder get _$this {
    if (_$v != null) {
      _success = _$v.success;
      _message = _$v.message;
      _user = _$v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActivitySubmitResult other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ActivitySubmitResult;
  }

  @override
  void update(void Function(ActivitySubmitResultBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ActivitySubmitResult build() {
    _$ActivitySubmitResult _$result;
    try {
      _$result = _$v ??
          new _$ActivitySubmitResult._(
              success: success, message: message, user: _user?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ActivitySubmitResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
