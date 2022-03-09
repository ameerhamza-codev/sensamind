// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ForgotPassword> _$forgotPasswordSerializer =
    new _$ForgotPasswordSerializer();

class _$ForgotPasswordSerializer
    implements StructuredSerializer<ForgotPassword> {
  @override
  final Iterable<Type> types = const [ForgotPassword, _$ForgotPassword];
  @override
  final String wireName = 'ForgotPassword';

  @override
  Iterable<Object> serialize(Serializers serializers, ForgotPassword object,
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
  ForgotPassword deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ForgotPasswordBuilder();

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

class _$ForgotPassword extends ForgotPassword {
  @override
  final bool success;
  @override
  final String message;

  factory _$ForgotPassword([void Function(ForgotPasswordBuilder) updates]) =>
      (new ForgotPasswordBuilder()..update(updates)).build();

  _$ForgotPassword._({this.success, this.message}) : super._() {
    if (success == null) {
      throw new BuiltValueNullFieldError('ForgotPassword', 'success');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('ForgotPassword', 'message');
    }
  }

  @override
  ForgotPassword rebuild(void Function(ForgotPasswordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ForgotPasswordBuilder toBuilder() =>
      new ForgotPasswordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ForgotPassword &&
        success == other.success &&
        message == other.message;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, success.hashCode), message.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ForgotPassword')
          ..add('success', success)
          ..add('message', message))
        .toString();
  }
}

class ForgotPasswordBuilder
    implements Builder<ForgotPassword, ForgotPasswordBuilder> {
  _$ForgotPassword _$v;

  bool _success;
  bool get success => _$this._success;
  set success(bool success) => _$this._success = success;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  ForgotPasswordBuilder();

  ForgotPasswordBuilder get _$this {
    if (_$v != null) {
      _success = _$v.success;
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ForgotPassword other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ForgotPassword;
  }

  @override
  void update(void Function(ForgotPasswordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ForgotPassword build() {
    final _$result =
        _$v ?? new _$ForgotPassword._(success: success, message: message);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
