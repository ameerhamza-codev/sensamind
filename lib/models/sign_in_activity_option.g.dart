// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_activity_option.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SignInActivityOption extends SignInActivityOption {
  @override
  final String id;
  @override
  final String value;

  factory _$SignInActivityOption(
          [void Function(SignInActivityOptionBuilder) updates]) =>
      (new SignInActivityOptionBuilder()..update(updates)).build();

  _$SignInActivityOption._({this.id, this.value}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('SignInActivityOption', 'id');
    }
    if (value == null) {
      throw new BuiltValueNullFieldError('SignInActivityOption', 'value');
    }
  }

  @override
  SignInActivityOption rebuild(
          void Function(SignInActivityOptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignInActivityOptionBuilder toBuilder() =>
      new SignInActivityOptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignInActivityOption &&
        id == other.id &&
        value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignInActivityOption')
          ..add('id', id)
          ..add('value', value))
        .toString();
  }
}

class SignInActivityOptionBuilder
    implements Builder<SignInActivityOption, SignInActivityOptionBuilder> {
  _$SignInActivityOption _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _value;
  String get value => _$this._value;
  set value(String value) => _$this._value = value;

  SignInActivityOptionBuilder();

  SignInActivityOptionBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _value = _$v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignInActivityOption other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignInActivityOption;
  }

  @override
  void update(void Function(SignInActivityOptionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignInActivityOption build() {
    final _$result = _$v ?? new _$SignInActivityOption._(id: id, value: value);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
