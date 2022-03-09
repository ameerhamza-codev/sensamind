// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reason_submit_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReasonSubmitResponse> _$reasonSubmitResponseSerializer =
    new _$ReasonSubmitResponseSerializer();

class _$ReasonSubmitResponseSerializer
    implements StructuredSerializer<ReasonSubmitResponse> {
  @override
  final Iterable<Type> types = const [
    ReasonSubmitResponse,
    _$ReasonSubmitResponse
  ];
  @override
  final String wireName = 'ReasonSubmitResponse';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ReasonSubmitResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'success',
      serializers.serialize(object.success,
          specifiedType: const FullType(bool)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(AppUser)));
    }
    return result;
  }

  @override
  ReasonSubmitResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReasonSubmitResponseBuilder();

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

class _$ReasonSubmitResponse extends ReasonSubmitResponse {
  @override
  final bool success;
  @override
  final String message;
  @override
  final AppUser user;

  factory _$ReasonSubmitResponse(
          [void Function(ReasonSubmitResponseBuilder) updates]) =>
      (new ReasonSubmitResponseBuilder()..update(updates)).build();

  _$ReasonSubmitResponse._({this.success, this.message, this.user})
      : super._() {
    if (success == null) {
      throw new BuiltValueNullFieldError('ReasonSubmitResponse', 'success');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('ReasonSubmitResponse', 'message');
    }
  }

  @override
  ReasonSubmitResponse rebuild(
          void Function(ReasonSubmitResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReasonSubmitResponseBuilder toBuilder() =>
      new ReasonSubmitResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReasonSubmitResponse &&
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
    return (newBuiltValueToStringHelper('ReasonSubmitResponse')
          ..add('success', success)
          ..add('message', message)
          ..add('user', user))
        .toString();
  }
}

class ReasonSubmitResponseBuilder
    implements Builder<ReasonSubmitResponse, ReasonSubmitResponseBuilder> {
  _$ReasonSubmitResponse _$v;

  bool _success;
  bool get success => _$this._success;
  set success(bool success) => _$this._success = success;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  AppUserBuilder _user;
  AppUserBuilder get user => _$this._user ??= new AppUserBuilder();
  set user(AppUserBuilder user) => _$this._user = user;

  ReasonSubmitResponseBuilder();

  ReasonSubmitResponseBuilder get _$this {
    if (_$v != null) {
      _success = _$v.success;
      _message = _$v.message;
      _user = _$v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReasonSubmitResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ReasonSubmitResponse;
  }

  @override
  void update(void Function(ReasonSubmitResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ReasonSubmitResponse build() {
    _$ReasonSubmitResponse _$result;
    try {
      _$result = _$v ??
          new _$ReasonSubmitResponse._(
              success: success, message: message, user: _user?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ReasonSubmitResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
