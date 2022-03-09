// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_unlock.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserUnlock> _$userUnlockSerializer = new _$UserUnlockSerializer();

class _$UserUnlockSerializer implements StructuredSerializer<UserUnlock> {
  @override
  final Iterable<Type> types = const [UserUnlock, _$UserUnlock];
  @override
  final String wireName = 'UserUnlock';

  @override
  Iterable<Object> serialize(Serializers serializers, UserUnlock object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'result',
      serializers.serialize(object.result,
          specifiedType: const FullType(String)),
    ];
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  UserUnlock deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserUnlockBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'result':
          result.result = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserUnlock extends UserUnlock {
  @override
  final String result;
  @override
  final String email;

  factory _$UserUnlock([void Function(UserUnlockBuilder) updates]) =>
      (new UserUnlockBuilder()..update(updates)).build();

  _$UserUnlock._({this.result, this.email}) : super._() {
    if (result == null) {
      throw new BuiltValueNullFieldError('UserUnlock', 'result');
    }
  }

  @override
  UserUnlock rebuild(void Function(UserUnlockBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserUnlockBuilder toBuilder() => new UserUnlockBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserUnlock &&
        result == other.result &&
        email == other.email;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, result.hashCode), email.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserUnlock')
          ..add('result', result)
          ..add('email', email))
        .toString();
  }
}

class UserUnlockBuilder implements Builder<UserUnlock, UserUnlockBuilder> {
  _$UserUnlock _$v;

  String _result;
  String get result => _$this._result;
  set result(String result) => _$this._result = result;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  UserUnlockBuilder();

  UserUnlockBuilder get _$this {
    if (_$v != null) {
      _result = _$v.result;
      _email = _$v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserUnlock other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserUnlock;
  }

  @override
  void update(void Function(UserUnlockBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserUnlock build() {
    final _$result = _$v ?? new _$UserUnlock._(result: result, email: email);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
