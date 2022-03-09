// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'click_statistics.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ClickStatistics> _$clickStatisticsSerializer =
    new _$ClickStatisticsSerializer();
Serializer<ClickStat> _$clickStatSerializer = new _$ClickStatSerializer();

class _$ClickStatisticsSerializer
    implements StructuredSerializer<ClickStatistics> {
  @override
  final Iterable<Type> types = const [ClickStatistics, _$ClickStatistics];
  @override
  final String wireName = 'ClickStatistics';

  @override
  Iterable<Object> serialize(Serializers serializers, ClickStatistics object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'yesterday',
      serializers.serialize(object.yesterday,
          specifiedType: const FullType(ClickStat)),
      'today',
      serializers.serialize(object.today,
          specifiedType: const FullType(ClickStat)),
      'overall',
      serializers.serialize(object.overall,
          specifiedType: const FullType(ClickStat)),
    ];

    return result;
  }

  @override
  ClickStatistics deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClickStatisticsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'yesterday':
          result.yesterday.replace(serializers.deserialize(value,
              specifiedType: const FullType(ClickStat)) as ClickStat);
          break;
        case 'today':
          result.today.replace(serializers.deserialize(value,
              specifiedType: const FullType(ClickStat)) as ClickStat);
          break;
        case 'overall':
          result.overall.replace(serializers.deserialize(value,
              specifiedType: const FullType(ClickStat)) as ClickStat);
          break;
      }
    }

    return result.build();
  }
}

class _$ClickStatSerializer implements StructuredSerializer<ClickStat> {
  @override
  final Iterable<Type> types = const [ClickStat, _$ClickStat];
  @override
  final String wireName = 'ClickStat';

  @override
  Iterable<Object> serialize(Serializers serializers, ClickStat object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'mostClickedButton',
      serializers.serialize(object.mostClickedButton,
          specifiedType: const FullType(String)),
      'mostClickedCause',
      serializers.serialize(object.mostClickedCause,
          specifiedType: const FullType(String)),
      'percentage',
      serializers.serialize(object.percentage,
          specifiedType: const FullType(String)),
    ];
    if (object.totalClicks != null) {
      result
        ..add('totalClicks')
        ..add(serializers.serialize(object.totalClicks,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ClickStat deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ClickStatBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'mostClickedButton':
          result.mostClickedButton = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mostClickedCause':
          result.mostClickedCause = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'percentage':
          result.percentage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'totalClicks':
          result.totalClicks = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ClickStatistics extends ClickStatistics {
  @override
  final ClickStat yesterday;
  @override
  final ClickStat today;
  @override
  final ClickStat overall;

  factory _$ClickStatistics([void Function(ClickStatisticsBuilder) updates]) =>
      (new ClickStatisticsBuilder()..update(updates)).build();

  _$ClickStatistics._({this.yesterday, this.today, this.overall}) : super._() {
    if (yesterday == null) {
      throw new BuiltValueNullFieldError('ClickStatistics', 'yesterday');
    }
    if (today == null) {
      throw new BuiltValueNullFieldError('ClickStatistics', 'today');
    }
    if (overall == null) {
      throw new BuiltValueNullFieldError('ClickStatistics', 'overall');
    }
  }

  @override
  ClickStatistics rebuild(void Function(ClickStatisticsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClickStatisticsBuilder toBuilder() =>
      new ClickStatisticsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClickStatistics &&
        yesterday == other.yesterday &&
        today == other.today &&
        overall == other.overall;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, yesterday.hashCode), today.hashCode), overall.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ClickStatistics')
          ..add('yesterday', yesterday)
          ..add('today', today)
          ..add('overall', overall))
        .toString();
  }
}

class ClickStatisticsBuilder
    implements Builder<ClickStatistics, ClickStatisticsBuilder> {
  _$ClickStatistics _$v;

  ClickStatBuilder _yesterday;
  ClickStatBuilder get yesterday =>
      _$this._yesterday ??= new ClickStatBuilder();
  set yesterday(ClickStatBuilder yesterday) => _$this._yesterday = yesterday;

  ClickStatBuilder _today;
  ClickStatBuilder get today => _$this._today ??= new ClickStatBuilder();
  set today(ClickStatBuilder today) => _$this._today = today;

  ClickStatBuilder _overall;
  ClickStatBuilder get overall => _$this._overall ??= new ClickStatBuilder();
  set overall(ClickStatBuilder overall) => _$this._overall = overall;

  ClickStatisticsBuilder();

  ClickStatisticsBuilder get _$this {
    if (_$v != null) {
      _yesterday = _$v.yesterday?.toBuilder();
      _today = _$v.today?.toBuilder();
      _overall = _$v.overall?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClickStatistics other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ClickStatistics;
  }

  @override
  void update(void Function(ClickStatisticsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ClickStatistics build() {
    _$ClickStatistics _$result;
    try {
      _$result = _$v ??
          new _$ClickStatistics._(
              yesterday: yesterday.build(),
              today: today.build(),
              overall: overall.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'yesterday';
        yesterday.build();
        _$failedField = 'today';
        today.build();
        _$failedField = 'overall';
        overall.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ClickStatistics', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ClickStat extends ClickStat {
  @override
  final String mostClickedButton;
  @override
  final String mostClickedCause;
  @override
  final String percentage;
  @override
  final String totalClicks;

  factory _$ClickStat([void Function(ClickStatBuilder) updates]) =>
      (new ClickStatBuilder()..update(updates)).build();

  _$ClickStat._(
      {this.mostClickedButton,
      this.mostClickedCause,
      this.percentage,
      this.totalClicks})
      : super._() {
    if (mostClickedButton == null) {
      throw new BuiltValueNullFieldError('ClickStat', 'mostClickedButton');
    }
    if (mostClickedCause == null) {
      throw new BuiltValueNullFieldError('ClickStat', 'mostClickedCause');
    }
    if (percentage == null) {
      throw new BuiltValueNullFieldError('ClickStat', 'percentage');
    }
  }

  @override
  ClickStat rebuild(void Function(ClickStatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClickStatBuilder toBuilder() => new ClickStatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClickStat &&
        mostClickedButton == other.mostClickedButton &&
        mostClickedCause == other.mostClickedCause &&
        percentage == other.percentage &&
        totalClicks == other.totalClicks;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, mostClickedButton.hashCode), mostClickedCause.hashCode),
            percentage.hashCode),
        totalClicks.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ClickStat')
          ..add('mostClickedButton', mostClickedButton)
          ..add('mostClickedCause', mostClickedCause)
          ..add('percentage', percentage)
          ..add('totalClicks', totalClicks))
        .toString();
  }
}

class ClickStatBuilder implements Builder<ClickStat, ClickStatBuilder> {
  _$ClickStat _$v;

  String _mostClickedButton;
  String get mostClickedButton => _$this._mostClickedButton;
  set mostClickedButton(String mostClickedButton) =>
      _$this._mostClickedButton = mostClickedButton;

  String _mostClickedCause;
  String get mostClickedCause => _$this._mostClickedCause;
  set mostClickedCause(String mostClickedCause) =>
      _$this._mostClickedCause = mostClickedCause;

  String _percentage;
  String get percentage => _$this._percentage;
  set percentage(String percentage) => _$this._percentage = percentage;

  String _totalClicks;
  String get totalClicks => _$this._totalClicks;
  set totalClicks(String totalClicks) => _$this._totalClicks = totalClicks;

  ClickStatBuilder();

  ClickStatBuilder get _$this {
    if (_$v != null) {
      _mostClickedButton = _$v.mostClickedButton;
      _mostClickedCause = _$v.mostClickedCause;
      _percentage = _$v.percentage;
      _totalClicks = _$v.totalClicks;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClickStat other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ClickStat;
  }

  @override
  void update(void Function(ClickStatBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ClickStat build() {
    final _$result = _$v ??
        new _$ClickStat._(
            mostClickedButton: mostClickedButton,
            mostClickedCause: mostClickedCause,
            percentage: percentage,
            totalClicks: totalClicks);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
