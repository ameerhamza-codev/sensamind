// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_success.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SignInSuccess> _$signInSuccessSerializer =
    new _$SignInSuccessSerializer();

class _$SignInSuccessSerializer implements StructuredSerializer<SignInSuccess> {
  @override
  final Iterable<Type> types = const [SignInSuccess, _$SignInSuccess];
  @override
  final String wireName = 'SignInSuccess';

  @override
  Iterable<Object> serialize(Serializers serializers, SignInSuccess object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'success',
      serializers.serialize(object.success,
          specifiedType: const FullType(bool)),
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.currentUser,
          specifiedType: const FullType(AppUser)),
      'expires_in',
      serializers.serialize(object.expiresIn,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SignInSuccess deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SignInSuccessBuilder();

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
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user':
          result.currentUser.replace(serializers.deserialize(value,
              specifiedType: const FullType(AppUser)) as AppUser);
          break;
        case 'expires_in':
          result.expiresIn = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SignInSuccess extends SignInSuccess {
  @override
  final bool success;
  @override
  final String token;
  @override
  final AppUser currentUser;
  @override
  final String expiresIn;

  factory _$SignInSuccess([void Function(SignInSuccessBuilder) updates]) =>
      (new SignInSuccessBuilder()..update(updates)).build();

  _$SignInSuccess._(
      {this.success, this.token, this.currentUser, this.expiresIn})
      : super._() {
    if (success == null) {
      throw new BuiltValueNullFieldError('SignInSuccess', 'success');
    }
    if (token == null) {
      throw new BuiltValueNullFieldError('SignInSuccess', 'token');
    }
    if (currentUser == null) {
      throw new BuiltValueNullFieldError('SignInSuccess', 'currentUser');
    }
    if (expiresIn == null) {
      throw new BuiltValueNullFieldError('SignInSuccess', 'expiresIn');
    }
  }

  @override
  SignInSuccess rebuild(void Function(SignInSuccessBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignInSuccessBuilder toBuilder() => new SignInSuccessBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignInSuccess &&
        success == other.success &&
        token == other.token &&
        currentUser == other.currentUser &&
        expiresIn == other.expiresIn;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, success.hashCode), token.hashCode),
            currentUser.hashCode),
        expiresIn.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignInSuccess')
          ..add('success', success)
          ..add('token', token)
          ..add('currentUser', currentUser)
          ..add('expiresIn', expiresIn))
        .toString();
  }
}

class SignInSuccessBuilder
    implements Builder<SignInSuccess, SignInSuccessBuilder> {
  _$SignInSuccess _$v;

  bool _success;
  bool get success => _$this._success;
  set success(bool success) => _$this._success = success;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  AppUserBuilder _currentUser;
  AppUserBuilder get currentUser =>
      _$this._currentUser ??= new AppUserBuilder();
  set currentUser(AppUserBuilder currentUser) =>
      _$this._currentUser = currentUser;

  String _expiresIn;
  String get expiresIn => _$this._expiresIn;
  set expiresIn(String expiresIn) => _$this._expiresIn = expiresIn;

  SignInSuccessBuilder();

  SignInSuccessBuilder get _$this {
    if (_$v != null) {
      _success = _$v.success;
      _token = _$v.token;
      _currentUser = _$v.currentUser?.toBuilder();
      _expiresIn = _$v.expiresIn;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignInSuccess other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignInSuccess;
  }

  @override
  void update(void Function(SignInSuccessBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignInSuccess build() {
    _$SignInSuccess _$result;
    try {
      _$result = _$v ??
          new _$SignInSuccess._(
              success: success,
              token: token,
              currentUser: currentUser.build(),
              expiresIn: expiresIn);
      //api call here

    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'currentUser';
        currentUser.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SignInSuccess', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
