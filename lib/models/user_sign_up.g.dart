// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_up.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserSignUp> _$userSignUpSerializer = new _$UserSignUpSerializer();

class _$UserSignUpSerializer implements StructuredSerializer<UserSignUp> {
  @override
  final Iterable<Type> types = const [UserSignUp, _$UserSignUp];
  @override
  final String wireName = 'UserSignUp';

  @override
  Iterable<Object> serialize(Serializers serializers, UserSignUp object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'success',
      serializers.serialize(object.success,
          specifiedType: const FullType(bool)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UserSignUp deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserSignUpBuilder();

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
      }
    }

    return result.build();
  }
}

class _$UserSignUp extends UserSignUp {
  @override
  final bool success;
  @override
  final String message;

  factory _$UserSignUp([void Function(UserSignUpBuilder) updates]) =>
      (new UserSignUpBuilder()..update(updates)).build();

  _$UserSignUp._({this.success, this.message}) : super._() {
    if (success == null) {
      throw new BuiltValueNullFieldError('UserSignUp', 'success');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('UserSignUp', 'message');
    }
  }

  @override
  UserSignUp rebuild(void Function(UserSignUpBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserSignUpBuilder toBuilder() => new UserSignUpBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserSignUp &&
        success == other.success &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, success.hashCode), message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserSignUp')
          ..add('success', success)
          ..add('message', message))
        .toString();
  }
}

class UserSignUpBuilder implements Builder<UserSignUp, UserSignUpBuilder> {
  _$UserSignUp _$v;

  bool _success;
  bool get success => _$this._success;
  set success(bool success) => _$this._success = success;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  UserSignUpBuilder();

  UserSignUpBuilder get _$this {
    if (_$v != null) {
      _success = _$v.success;
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserSignUp other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserSignUp;
  }

  @override
  void update(void Function(UserSignUpBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserSignUp build() {
    final _$result =
        _$v ?? new _$UserSignUp._(success: success, message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
