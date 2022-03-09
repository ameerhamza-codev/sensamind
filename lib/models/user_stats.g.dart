// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserStats> _$userStatsSerializer = new _$UserStatsSerializer();
Serializer<Statistics> _$statisticsSerializer = new _$StatisticsSerializer();
Serializer<ButtonClickData> _$buttonClickDataSerializer =
    new _$ButtonClickDataSerializer();
Serializer<CauseClickData> _$causeClickDataSerializer =
    new _$CauseClickDataSerializer();

class _$UserStatsSerializer implements StructuredSerializer<UserStats> {
  @override
  final Iterable<Type> types = const [UserStats, _$UserStats];
  @override
  final String wireName = 'UserStats';

  @override
  Iterable<Object> serialize(Serializers serializers, UserStats object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'success',
      serializers.serialize(object.success,
          specifiedType: const FullType(bool)),
      'today',
      serializers.serialize(object.today,
          specifiedType: const FullType(Statistics)),
      'yesterday',
      serializers.serialize(object.yesterday,
          specifiedType: const FullType(Statistics)),
      'overall',
      serializers.serialize(object.overall,
          specifiedType: const FullType(Statistics)),
    ];
    result.add('bluetoothClicks');
    if (object.bluetoothClicks == null) {
      result.add(null);
    } else {
      result.add(serializers.serialize(object.bluetoothClicks,
          specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  UserStats deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserStatsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      if (value == null) continue;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'today':
          result.today.replace(serializers.deserialize(value,
              specifiedType: const FullType(Statistics)) as Statistics);
          break;
        case 'yesterday':
          result.yesterday.replace(serializers.deserialize(value,
              specifiedType: const FullType(Statistics)) as Statistics);
          break;
        case 'overall':
          result.overall.replace(serializers.deserialize(value,
              specifiedType: const FullType(Statistics)) as Statistics);
          break;
        case 'bluetoothClicks':
          result.bluetoothClicks = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$StatisticsSerializer implements StructuredSerializer<Statistics> {
  @override
  final Iterable<Type> types = const [Statistics, _$Statistics];
  @override
  final String wireName = 'Statistics';

  @override
  Iterable<Object> serialize(Serializers serializers, Statistics object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'button_clicks',
      serializers.serialize(object.buttonClickData,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ButtonClickData)])),
      'cause_clicks',
      serializers.serialize(object.causeClickData,
          specifiedType: const FullType(
              BuiltList, const [const FullType(CauseClickData)])),
    ];
    result.add('total');
    if (object.total == null) {
      result.add(null);
    } else {
      result.add(serializers.serialize(object.total,
          specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  Statistics deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StatisticsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      if (value == null) continue;
      switch (key) {
        case 'button_clicks':
          result.buttonClickData.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ButtonClickData)]))
              as BuiltList<Object>);
          break;
        case 'cause_clicks':
          result.causeClickData.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CauseClickData)]))
              as BuiltList<Object>);
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ButtonClickDataSerializer
    implements StructuredSerializer<ButtonClickData> {
  @override
  final Iterable<Type> types = const [ButtonClickData, _$ButtonClickData];
  @override
  final String wireName = 'ButtonClickData';

  @override
  Iterable<Object> serialize(Serializers serializers, ButtonClickData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'button',
      serializers.serialize(object.button,
          specifiedType: const FullType(String)),
      'total',
      serializers.serialize(object.total,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ButtonClickData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ButtonClickDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'button':
          result.button = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CauseClickDataSerializer
    implements StructuredSerializer<CauseClickData> {
  @override
  final Iterable<Type> types = const [CauseClickData, _$CauseClickData];
  @override
  final String wireName = 'CauseClickData';

  @override
  Iterable<Object> serialize(Serializers serializers, CauseClickData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'cause',
      serializers.serialize(object.cause,
          specifiedType: const FullType(String)),
      'total',
      serializers.serialize(object.total,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CauseClickData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CauseClickDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'cause':
          result.cause = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserStats extends UserStats {
  @override
  final bool success;
  @override
  final Statistics today;
  @override
  final Statistics yesterday;
  @override
  final Statistics overall;
  @override
  final int bluetoothClicks;

  factory _$UserStats([void Function(UserStatsBuilder) updates]) =>
      (new UserStatsBuilder()..update(updates)).build();

  _$UserStats._(
      {this.success,
      this.today,
      this.yesterday,
      this.overall,
      this.bluetoothClicks})
      : super._() {
    if (success == null) {
      throw new BuiltValueNullFieldError('UserStats', 'success');
    }
    if (today == null) {
      throw new BuiltValueNullFieldError('UserStats', 'today');
    }
    if (yesterday == null) {
      throw new BuiltValueNullFieldError('UserStats', 'yesterday');
    }
    if (overall == null) {
      throw new BuiltValueNullFieldError('UserStats', 'overall');
    }
  }

  @override
  UserStats rebuild(void Function(UserStatsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStatsBuilder toBuilder() => new UserStatsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserStats &&
        success == other.success &&
        today == other.today &&
        yesterday == other.yesterday &&
        overall == other.overall &&
        bluetoothClicks == other.bluetoothClicks;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, success.hashCode), today.hashCode),
                yesterday.hashCode),
            overall.hashCode),
        bluetoothClicks.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserStats')
          ..add('success', success)
          ..add('today', today)
          ..add('yesterday', yesterday)
          ..add('overall', overall)
          ..add('bluetoothClicks', bluetoothClicks))
        .toString();
  }
}

class UserStatsBuilder implements Builder<UserStats, UserStatsBuilder> {
  _$UserStats _$v;

  bool _success;
  bool get success => _$this._success;
  set success(bool success) => _$this._success = success;

  StatisticsBuilder _today;
  StatisticsBuilder get today => _$this._today ??= new StatisticsBuilder();
  set today(StatisticsBuilder today) => _$this._today = today;

  StatisticsBuilder _yesterday;
  StatisticsBuilder get yesterday =>
      _$this._yesterday ??= new StatisticsBuilder();
  set yesterday(StatisticsBuilder yesterday) => _$this._yesterday = yesterday;

  StatisticsBuilder _overall;
  StatisticsBuilder get overall => _$this._overall ??= new StatisticsBuilder();
  set overall(StatisticsBuilder overall) => _$this._overall = overall;

  int _bluetoothClicks;
  int get bluetoothClicks => _$this._bluetoothClicks;
  set bluetoothClicks(int bluetoothClicks) =>
      _$this._bluetoothClicks = bluetoothClicks;

  UserStatsBuilder();

  UserStatsBuilder get _$this {
    if (_$v != null) {
      _success = _$v.success;
      _today = _$v.today?.toBuilder();
      _yesterday = _$v.yesterday?.toBuilder();
      _overall = _$v.overall?.toBuilder();
      _bluetoothClicks = _$v.bluetoothClicks;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserStats other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$UserStats;
  }

  @override
  void update(void Function(UserStatsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserStats build() {
    _$UserStats _$result;
    try {
      _$result = _$v ??
          new _$UserStats._(
              success: success,
              today: today.build(),
              yesterday: yesterday.build(),
              overall: overall.build(),
              bluetoothClicks: bluetoothClicks);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'today';
        today.build();
        _$failedField = 'yesterday';
        yesterday.build();
        _$failedField = 'overall';
        overall.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UserStats', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Statistics extends Statistics {
  @override
  final BuiltList<ButtonClickData> buttonClickData;
  @override
  final BuiltList<CauseClickData> causeClickData;
  @override
  final int total;

  factory _$Statistics([void Function(StatisticsBuilder) updates]) =>
      (new StatisticsBuilder()..update(updates)).build();

  _$Statistics._({this.buttonClickData, this.causeClickData, this.total})
      : super._() {
    if (buttonClickData == null) {
      throw new BuiltValueNullFieldError('Statistics', 'buttonClickData');
    }
    if (causeClickData == null) {
      throw new BuiltValueNullFieldError('Statistics', 'causeClickData');
    }
  }

  @override
  Statistics rebuild(void Function(StatisticsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StatisticsBuilder toBuilder() => new StatisticsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Statistics &&
        buttonClickData == other.buttonClickData &&
        causeClickData == other.causeClickData &&
        total == other.total;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, buttonClickData.hashCode), causeClickData.hashCode),
        total.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Statistics')
          ..add('buttonClickData', buttonClickData)
          ..add('causeClickData', causeClickData)
          ..add('total', total))
        .toString();
  }
}

class StatisticsBuilder implements Builder<Statistics, StatisticsBuilder> {
  _$Statistics _$v;

  ListBuilder<ButtonClickData> _buttonClickData;
  ListBuilder<ButtonClickData> get buttonClickData =>
      _$this._buttonClickData ??= new ListBuilder<ButtonClickData>();
  set buttonClickData(ListBuilder<ButtonClickData> buttonClickData) =>
      _$this._buttonClickData = buttonClickData;

  ListBuilder<CauseClickData> _causeClickData;
  ListBuilder<CauseClickData> get causeClickData =>
      _$this._causeClickData ??= new ListBuilder<CauseClickData>();
  set causeClickData(ListBuilder<CauseClickData> causeClickData) =>
      _$this._causeClickData = causeClickData;

  int _total;
  int get total => _$this._total;
  set total(int total) => _$this._total = total;

  StatisticsBuilder();

  StatisticsBuilder get _$this {
    if (_$v != null) {
      _buttonClickData = _$v.buttonClickData?.toBuilder();
      _causeClickData = _$v.causeClickData?.toBuilder();
      _total = _$v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Statistics other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Statistics;
  }

  @override
  void update(void Function(StatisticsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Statistics build() {
    _$Statistics _$result;
    try {
      _$result = _$v ??
          new _$Statistics._(
              buttonClickData: buttonClickData.build(),
              causeClickData: causeClickData.build(),
              total: total);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'buttonClickData';
        buttonClickData.build();
        _$failedField = 'causeClickData';
        causeClickData.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Statistics', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ButtonClickData extends ButtonClickData {
  @override
  final String button;
  @override
  final String total;

  factory _$ButtonClickData([void Function(ButtonClickDataBuilder) updates]) =>
      (new ButtonClickDataBuilder()..update(updates)).build();

  _$ButtonClickData._({this.button, this.total}) : super._() {
    if (button == null) {
      throw new BuiltValueNullFieldError('ButtonClickData', 'button');
    }
    if (total == null) {
      throw new BuiltValueNullFieldError('ButtonClickData', 'total');
    }
  }

  @override
  ButtonClickData rebuild(void Function(ButtonClickDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ButtonClickDataBuilder toBuilder() =>
      new ButtonClickDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ButtonClickData &&
        button == other.button &&
        total == other.total;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, button.hashCode), total.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ButtonClickData')
          ..add('button', button)
          ..add('total', total))
        .toString();
  }
}

class ButtonClickDataBuilder
    implements Builder<ButtonClickData, ButtonClickDataBuilder> {
  _$ButtonClickData _$v;

  String _button;
  String get button => _$this._button;
  set button(String button) => _$this._button = button;

  String _total;
  String get total => _$this._total;
  set total(String total) => _$this._total = total;

  ButtonClickDataBuilder();

  ButtonClickDataBuilder get _$this {
    if (_$v != null) {
      _button = _$v.button;
      _total = _$v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ButtonClickData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ButtonClickData;
  }

  @override
  void update(void Function(ButtonClickDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ButtonClickData build() {
    final _$result =
        _$v ?? new _$ButtonClickData._(button: button, total: total);
    replace(_$result);
    return _$result;
  }
}

class _$CauseClickData extends CauseClickData {
  @override
  final String cause;
  @override
  final String total;

  factory _$CauseClickData([void Function(CauseClickDataBuilder) updates]) =>
      (new CauseClickDataBuilder()..update(updates)).build();

  _$CauseClickData._({this.cause, this.total}) : super._() {
    if (cause == null) {
      throw new BuiltValueNullFieldError('CauseClickData', 'cause');
    }
    if (total == null) {
      throw new BuiltValueNullFieldError('CauseClickData', 'total');
    }
  }

  @override
  CauseClickData rebuild(void Function(CauseClickDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CauseClickDataBuilder toBuilder() =>
      new CauseClickDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CauseClickData &&
        cause == other.cause &&
        total == other.total;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, cause.hashCode), total.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CauseClickData')
          ..add('cause', cause)
          ..add('total', total))
        .toString();
  }
}

class CauseClickDataBuilder
    implements Builder<CauseClickData, CauseClickDataBuilder> {
  _$CauseClickData _$v;

  String _cause;
  String get cause => _$this._cause;
  set cause(String cause) => _$this._cause = cause;

  String _total;
  String get total => _$this._total;
  set total(String total) => _$this._total = total;

  CauseClickDataBuilder();

  CauseClickDataBuilder get _$this {
    if (_$v != null) {
      _cause = _$v.cause;
      _total = _$v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CauseClickData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CauseClickData;
  }

  @override
  void update(void Function(CauseClickDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CauseClickData build() {
    final _$result = _$v ?? new _$CauseClickData._(cause: cause, total: total);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
