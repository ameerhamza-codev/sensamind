// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bt_click_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BtClickData> _$btClickDataSerializer = new _$BtClickDataSerializer();

class _$BtClickDataSerializer implements StructuredSerializer<BtClickData> {
  @override
  final Iterable<Type> types = const [BtClickData, _$BtClickData];
  @override
  final String wireName = 'BtClickData';

  @override
  Iterable<Object> serialize(Serializers serializers, BtClickData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'button',
      serializers.serialize(object.button, specifiedType: const FullType(int)),
      'clicked_at',
      serializers.serialize(object.clickedAt,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  BtClickData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BtClickDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'button':
          result.button = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'clicked_at':
          result.clickedAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$BtClickData extends BtClickData {
  @override
  final int button;
  @override
  final DateTime clickedAt;

  factory _$BtClickData([void Function(BtClickDataBuilder) updates]) =>
      (new BtClickDataBuilder()..update(updates)).build();

  _$BtClickData._({this.button, this.clickedAt}) : super._() {
    if (button == null) {
      throw new BuiltValueNullFieldError('BtClickData', 'button');
    }
    if (clickedAt == null) {
      throw new BuiltValueNullFieldError('BtClickData', 'clickedAt');
    }
  }

  @override
  BtClickData rebuild(void Function(BtClickDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BtClickDataBuilder toBuilder() => new BtClickDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BtClickData &&
        button == other.button &&
        clickedAt == other.clickedAt;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, button.hashCode), clickedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BtClickData')
          ..add('button', button)
          ..add('clickedAt', clickedAt))
        .toString();
  }
}

class BtClickDataBuilder implements Builder<BtClickData, BtClickDataBuilder> {
  _$BtClickData _$v;

  int _button;
  int get button => _$this._button;
  set button(int button) => _$this._button = button;

  DateTime _clickedAt;
  DateTime get clickedAt => _$this._clickedAt;
  set clickedAt(DateTime clickedAt) => _$this._clickedAt = clickedAt;

  BtClickDataBuilder();

  BtClickDataBuilder get _$this {
    if (_$v != null) {
      _button = _$v.button;
      _clickedAt = _$v.clickedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BtClickData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BtClickData;
  }

  @override
  void update(void Function(BtClickDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BtClickData build() {
    final _$result =
        _$v ?? new _$BtClickData._(button: button, clickedAt: clickedAt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
