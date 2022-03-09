// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'click_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ClickDataList> _$clickDataListSerializer =
    new _$ClickDataListSerializer();
Serializer<ClickData> _$clickDataSerializer = new _$ClickDataSerializer();

class _$ClickDataListSerializer implements StructuredSerializer<ClickDataList> {
  @override
  final Iterable<Type> types = const [ClickDataList, _$ClickDataList];
  @override
  final String wireName = 'ClickDataList';

  @override
  Iterable<Object> serialize(Serializers serializers, ClickDataList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    result.add('clickDataList');
    if (object.clickDataList == null) {
      result.add(null);
    } else {
      result.add(serializers.serialize(object.clickDataList,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ClickData)])));
    }
    return result;
  }

  @override
  ClickDataList deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClickDataListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      if (value == null) continue;
      switch (key) {
        case 'clickDataList':
          result.clickDataList.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ClickData)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$ClickDataSerializer implements StructuredSerializer<ClickData> {
  @override
  final Iterable<Type> types = const [ClickData, _$ClickData];
  @override
  final String wireName = 'ClickData';

  @override
  Iterable<Object> serialize(Serializers serializers, ClickData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    result.add('button');
    if (object.button == null) {
      result.add(null);
    } else {
      result.add(serializers.serialize(object.button,
          specifiedType: const FullType(String)));
    }
    result.add('button_id');
    if (object.buttonId == null) {
      result.add(null);
    } else {
      result.add(serializers.serialize(object.buttonId,
          specifiedType: const FullType(String)));
    }
    result.add('cause');
    if (object.cause == null) {
      result.add(null);
    } else {
      result.add(serializers.serialize(object.cause,
          specifiedType: const FullType(String)));
    }
    result.add('clicked_at');
    if (object.clickedAt == null) {
      result.add(null);
    } else {
      result.add(serializers.serialize(object.clickedAt,
          specifiedType: const FullType(String)));
    }
    result.add('click_unsent');
    if (object.clickUnsent == null) {
      result.add(null);
    } else {
      result.add(serializers.serialize(object.clickUnsent,
          specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  ClickData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClickDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      if (value == null) continue;
      switch (key) {
        case 'button':
          result.button = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'button_id':
          result.buttonId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cause':
          result.cause = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'clicked_at':
          result.clickedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'click_unsent':
          result.clickUnsent = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$ClickDataList extends ClickDataList {
  @override
  final BuiltList<ClickData> clickDataList;

  factory _$ClickDataList([void Function(ClickDataListBuilder) updates]) =>
      (new ClickDataListBuilder()..update(updates)).build();

  _$ClickDataList._({this.clickDataList}) : super._();

  @override
  ClickDataList rebuild(void Function(ClickDataListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClickDataListBuilder toBuilder() => new ClickDataListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClickDataList && clickDataList == other.clickDataList;
  }

  @override
  int get hashCode {
    return $jf($jc(0, clickDataList.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ClickDataList')
          ..add('clickDataList', clickDataList))
        .toString();
  }
}

class ClickDataListBuilder
    implements Builder<ClickDataList, ClickDataListBuilder> {
  _$ClickDataList _$v;

  ListBuilder<ClickData> _clickDataList;
  ListBuilder<ClickData> get clickDataList =>
      _$this._clickDataList ??= new ListBuilder<ClickData>();
  set clickDataList(ListBuilder<ClickData> clickDataList) =>
      _$this._clickDataList = clickDataList;

  ClickDataListBuilder();

  ClickDataListBuilder get _$this {
    if (_$v != null) {
      _clickDataList = _$v.clickDataList?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClickDataList other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ClickDataList;
  }

  @override
  void update(void Function(ClickDataListBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ClickDataList build() {
    _$ClickDataList _$result;
    try {
      _$result =
          _$v ?? new _$ClickDataList._(clickDataList: _clickDataList?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'clickDataList';
        _clickDataList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ClickDataList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ClickData extends ClickData {
  @override
  final String button;
  @override
  final String buttonId;
  @override
  final String cause;
  @override
  final String clickedAt;
  @override
  final bool clickUnsent;

  factory _$ClickData([void Function(ClickDataBuilder) updates]) =>
      (new ClickDataBuilder()..update(updates)).build();

  _$ClickData._(
      {this.button,
      this.buttonId,
      this.cause,
      this.clickedAt,
      this.clickUnsent})
      : super._();

  @override
  ClickData rebuild(void Function(ClickDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClickDataBuilder toBuilder() => new ClickDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClickData &&
        button == other.button &&
        buttonId == other.buttonId &&
        cause == other.cause &&
        clickedAt == other.clickedAt &&
        clickUnsent == other.clickUnsent;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, button.hashCode), buttonId.hashCode),
                cause.hashCode),
            clickedAt.hashCode),
        clickUnsent.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ClickData')
          ..add('button', button)
          ..add('buttonId', buttonId)
          ..add('cause', cause)
          ..add('clickedAt', clickedAt)
          ..add('clickUnsent', clickUnsent))
        .toString();
  }
}

class ClickDataBuilder implements Builder<ClickData, ClickDataBuilder> {
  _$ClickData _$v;

  String _button;
  String get button => _$this._button;
  set button(String button) => _$this._button = button;

  String _buttonId;
  String get buttonId => _$this._buttonId;
  set buttonId(String buttonId) => _$this._buttonId = buttonId;

  String _cause;
  String get cause => _$this._cause;
  set cause(String cause) => _$this._cause = cause;

  String _clickedAt;
  String get clickedAt => _$this._clickedAt;
  set clickedAt(String clickedAt) => _$this._clickedAt = clickedAt;

  bool _clickUnsent;
  bool get clickUnsent => _$this._clickUnsent;
  set clickUnsent(bool clickUnsent) => _$this._clickUnsent = clickUnsent;

  ClickDataBuilder();

  ClickDataBuilder get _$this {
    if (_$v != null) {
      _button = _$v.button;
      _buttonId = _$v.buttonId;
      _cause = _$v.cause;
      _clickedAt = _$v.clickedAt;
      _clickUnsent = _$v.clickUnsent;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClickData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ClickData;
  }

  @override
  void update(void Function(ClickDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ClickData build() {
    final _$result = _$v ??
        new _$ClickData._(
            button: button,
            buttonId: buttonId,
            cause: cause,
            clickedAt: clickedAt,
            clickUnsent: clickUnsent);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
