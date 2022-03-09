// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_error.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppError> _$appErrorSerializer = new _$AppErrorSerializer();
Serializer<Error> _$errorSerializer = new _$ErrorSerializer();

class _$AppErrorSerializer implements StructuredSerializer<AppError> {
  @override
  final Iterable<Type> types = const [AppError, _$AppError];
  @override
  final String wireName = 'AppError';

  @override
  Iterable<Object> serialize(Serializers serializers, AppError object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'error',
      serializers.serialize(object.error, specifiedType: const FullType(Error)),
    ];
    if (object.success != null) {
      result
        ..add('success')
        ..add(serializers.serialize(object.success,
            specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  AppError deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppErrorBuilder();

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
        case 'error':
          result.error.replace(serializers.deserialize(value,
              specifiedType: const FullType(Error)) as Error);
          break;
      }
    }

    return result.build();
  }
}

class _$ErrorSerializer implements StructuredSerializer<Error> {
  @override
  final Iterable<Type> types = const [Error, _$Error];
  @override
  final String wireName = 'Error';

  @override
  Iterable<Object> serialize(Serializers serializers, Error object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];
    if (object.errors != null) {
      result
        ..add('errors')
        ..add(serializers.serialize(object.errors,
            specifiedType: const FullType(BuiltMap, const [
              const FullType(String),
              const FullType(BuiltList, const [const FullType(String)])
            ])));
    }
    return result;
  }

  @override
  Error deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ErrorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'errors':
          result.errors.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(BuiltList, const [const FullType(String)])
              ])));
          break;
      }
    }

    return result.build();
  }
}

class _$AppError extends AppError {
  @override
  final bool success;
  @override
  final Error error;

  factory _$AppError([void Function(AppErrorBuilder) updates]) =>
      (new AppErrorBuilder()..update(updates)).build();

  _$AppError._({this.success, this.error}) : super._() {
    if (error == null) {
      throw new BuiltValueNullFieldError('AppError', 'error');
    }
  }

  @override
  AppError rebuild(void Function(AppErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppErrorBuilder toBuilder() => new AppErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppError &&
        success == other.success &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, success.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppError')
          ..add('success', success)
          ..add('error', error))
        .toString();
  }
}

class AppErrorBuilder implements Builder<AppError, AppErrorBuilder> {
  _$AppError _$v;

  bool _success;
  bool get success => _$this._success;
  set success(bool success) => _$this._success = success;

  ErrorBuilder _error;
  ErrorBuilder get error => _$this._error ??= new ErrorBuilder();
  set error(ErrorBuilder error) => _$this._error = error;

  AppErrorBuilder();

  AppErrorBuilder get _$this {
    if (_$v != null) {
      _success = _$v.success;
      _error = _$v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppError other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppError;
  }

  @override
  void update(void Function(AppErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppError build() {
    _$AppError _$result;
    try {
      _$result =
          _$v ?? new _$AppError._(success: success, error: error.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'error';
        error.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppError', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Error extends Error {
  @override
  final String message;
  @override
  final BuiltMap<String, BuiltList<String>> errors;

  factory _$Error([void Function(ErrorBuilder) updates]) =>
      (new ErrorBuilder()..update(updates)).build();

  _$Error._({this.message, this.errors}) : super._() {
    if (message == null) {
      throw new BuiltValueNullFieldError('Error', 'message');
    }
  }

  @override
  Error rebuild(void Function(ErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ErrorBuilder toBuilder() => new ErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Error && message == other.message && errors == other.errors;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), errors.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Error')
          ..add('message', message)
          ..add('errors', errors))
        .toString();
  }
}

class ErrorBuilder implements Builder<Error, ErrorBuilder> {
  _$Error _$v;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  MapBuilder<String, BuiltList<String>> _errors;
  MapBuilder<String, BuiltList<String>> get errors =>
      _$this._errors ??= new MapBuilder<String, BuiltList<String>>();
  set errors(MapBuilder<String, BuiltList<String>> errors) =>
      _$this._errors = errors;

  ErrorBuilder();

  ErrorBuilder get _$this {
    if (_$v != null) {
      _message = _$v.message;
      _errors = _$v.errors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Error other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Error;
  }

  @override
  void update(void Function(ErrorBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Error build() {
    _$Error _$result;
    try {
      _$result =
          _$v ?? new _$Error._(message: message, errors: _errors?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'errors';
        _errors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Error', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
