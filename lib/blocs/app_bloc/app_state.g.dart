// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable<Object> serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'initializing',
      serializers.serialize(object.initializing,
          specifiedType: const FullType(bool)),
      'isAuthenticated',
      serializers.serialize(object.isAuthenticated,
          specifiedType: const FullType(bool)),
      'isRegistered',
      serializers.serialize(object.isRegistered,
          specifiedType: const FullType(bool)),
      'isLocked',
      serializers.serialize(object.isLocked,
          specifiedType: const FullType(bool)),
      'isSetupCompleted',
      serializers.serialize(object.isSetupCompleted,
          specifiedType: const FullType(bool)),
      'playSounds',
      serializers.serialize(object.playSounds,
          specifiedType: const FullType(bool)),
      'showNotifications',
      serializers.serialize(object.showNotifications,
          specifiedType: const FullType(bool)),
      'loading',
      serializers.serialize(object.loading,
          specifiedType: const FullType(bool)),
    ];
    if (object.userDetails != null) {
      result
        ..add('userDetails')
        ..add(serializers.serialize(object.userDetails,
            specifiedType: const FullType(SignInSuccess)));
    }
    if (object.userStats != null) {
      result
        ..add('userStats')
        ..add(serializers.serialize(object.userStats,
            specifiedType: const FullType(UserStats)));
    }
    if (object.clickStatistics != null) {
      result
        ..add('clickStatistics')
        ..add(serializers.serialize(object.clickStatistics,
            specifiedType: const FullType(ClickStatistics)));
    }
    if (object.appInfo != null) {
      result
        ..add('appInfo')
        ..add(serializers.serialize(object.appInfo,
            specifiedType: const FullType(AppInfo)));
    }
    if (object.exceptionMessage != null) {
      result
        ..add('exceptionMessage')
        ..add(serializers.serialize(object.exceptionMessage,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'initializing':
          result.initializing = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isAuthenticated':
          result.isAuthenticated = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isRegistered':
          result.isRegistered = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isLocked':
          result.isLocked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'isSetupCompleted':
          result.isSetupCompleted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'playSounds':
          result.playSounds = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'showNotifications':
          result.showNotifications = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'userDetails':
          result.userDetails.replace(serializers.deserialize(value,
              specifiedType: const FullType(SignInSuccess)) as SignInSuccess);
          break;
        case 'userStats':
          result.userStats.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserStats)) as UserStats);
          break;
        case 'clickStatistics':
          result.clickStatistics.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ClickStatistics))
              as ClickStatistics);
          break;
        case 'appInfo':
          result.appInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(AppInfo)) as AppInfo);
          break;
        case 'exceptionMessage':
          result.exceptionMessage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'loading':
          result.loading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final bool initializing;
  @override
  final bool isAuthenticated;
  @override
  final bool isRegistered;
  @override
  final bool isLocked;
  @override
  final bool isSetupCompleted;
  @override
  final bool playSounds;
  @override
  final bool showNotifications;
  @override
  final SignInSuccess userDetails;
  @override
  final UserStats userStats;
  @override
  final ClickStatistics clickStatistics;
  @override
  final AppInfo appInfo;
  @override
  final String exceptionMessage;
  @override
  final bool loading;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.initializing,
      this.isAuthenticated,
      this.isRegistered,
      this.isLocked,
      this.isSetupCompleted,
      this.playSounds,
      this.showNotifications,
      this.userDetails,
      this.userStats,
      this.clickStatistics,
      this.appInfo,
      this.exceptionMessage,
      this.loading})
      : super._() {
    if (initializing == null) {
      throw new BuiltValueNullFieldError('AppState', 'initializing');
    }
    if (isAuthenticated == null) {
      throw new BuiltValueNullFieldError('AppState', 'isAuthenticated');
    }
    if (isRegistered == null) {
      throw new BuiltValueNullFieldError('AppState', 'isRegistered');
    }
    if (isLocked == null) {
      throw new BuiltValueNullFieldError('AppState', 'isLocked');
    }
    if (isSetupCompleted == null) {
      throw new BuiltValueNullFieldError('AppState', 'isSetupCompleted');
    }
    if (playSounds == null) {
      throw new BuiltValueNullFieldError('AppState', 'playSounds');
    }
    if (showNotifications == null) {
      throw new BuiltValueNullFieldError('AppState', 'showNotifications');
    }
    if (loading == null) {
      throw new BuiltValueNullFieldError('AppState', 'loading');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        initializing == other.initializing &&
        isAuthenticated == other.isAuthenticated &&
        isRegistered == other.isRegistered &&
        isLocked == other.isLocked &&
        isSetupCompleted == other.isSetupCompleted &&
        playSounds == other.playSounds &&
        showNotifications == other.showNotifications &&
        userDetails == other.userDetails &&
        userStats == other.userStats &&
        clickStatistics == other.clickStatistics &&
        appInfo == other.appInfo &&
        exceptionMessage == other.exceptionMessage &&
        loading == other.loading;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(0,
                                                        initializing.hashCode),
                                                    isAuthenticated.hashCode),
                                                isRegistered.hashCode),
                                            isLocked.hashCode),
                                        isSetupCompleted.hashCode),
                                    playSounds.hashCode),
                                showNotifications.hashCode),
                            userDetails.hashCode),
                        userStats.hashCode),
                    clickStatistics.hashCode),
                appInfo.hashCode),
            exceptionMessage.hashCode),
        loading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('initializing', initializing)
          ..add('isAuthenticated', isAuthenticated)
          ..add('isRegistered', isRegistered)
          ..add('isLocked', isLocked)
          ..add('isSetupCompleted', isSetupCompleted)
          ..add('playSounds', playSounds)
          ..add('showNotifications', showNotifications)
          ..add('userDetails', userDetails)
          ..add('userStats', userStats)
          ..add('clickStatistics', clickStatistics)
          ..add('appInfo', appInfo)
          ..add('exceptionMessage', exceptionMessage)
          ..add('loading', loading))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  bool _initializing;
  bool get initializing => _$this._initializing;
  set initializing(bool initializing) => _$this._initializing = initializing;

  bool _isAuthenticated;
  bool get isAuthenticated => _$this._isAuthenticated;
  set isAuthenticated(bool isAuthenticated) =>
      _$this._isAuthenticated = isAuthenticated;

  bool _isRegistered;
  bool get isRegistered => _$this._isRegistered;
  set isRegistered(bool isRegistered) => _$this._isRegistered = isRegistered;

  bool _isLocked;
  bool get isLocked => _$this._isLocked;
  set isLocked(bool isLocked) => _$this._isLocked = isLocked;

  bool _isSetupCompleted;
  bool get isSetupCompleted => _$this._isSetupCompleted;
  set isSetupCompleted(bool isSetupCompleted) =>
      _$this._isSetupCompleted = isSetupCompleted;

  bool _playSounds;
  bool get playSounds => _$this._playSounds;
  set playSounds(bool playSounds) => _$this._playSounds = playSounds;

  bool _showNotifications;
  bool get showNotifications => _$this._showNotifications;
  set showNotifications(bool showNotifications) =>
      _$this._showNotifications = showNotifications;

  SignInSuccessBuilder _userDetails;
  SignInSuccessBuilder get userDetails =>
      _$this._userDetails ??= new SignInSuccessBuilder();
  set userDetails(SignInSuccessBuilder userDetails) =>
      _$this._userDetails = userDetails;

  UserStatsBuilder _userStats;
  UserStatsBuilder get userStats =>
      _$this._userStats ??= new UserStatsBuilder();
  set userStats(UserStatsBuilder userStats) => _$this._userStats = userStats;

  ClickStatisticsBuilder _clickStatistics;
  ClickStatisticsBuilder get clickStatistics =>
      _$this._clickStatistics ??= new ClickStatisticsBuilder();
  set clickStatistics(ClickStatisticsBuilder clickStatistics) =>
      _$this._clickStatistics = clickStatistics;

  AppInfoBuilder _appInfo;
  AppInfoBuilder get appInfo => _$this._appInfo ??= new AppInfoBuilder();
  set appInfo(AppInfoBuilder appInfo) => _$this._appInfo = appInfo;

  String _exceptionMessage;
  String get exceptionMessage => _$this._exceptionMessage;
  set exceptionMessage(String exceptionMessage) =>
      _$this._exceptionMessage = exceptionMessage;

  bool _loading;
  bool get loading => _$this._loading;
  set loading(bool loading) => _$this._loading = loading;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _initializing = _$v.initializing;
      _isAuthenticated = _$v.isAuthenticated;
      _isRegistered = _$v.isRegistered;
      _isLocked = _$v.isLocked;
      _isSetupCompleted = _$v.isSetupCompleted;
      _playSounds = _$v.playSounds;
      _showNotifications = _$v.showNotifications;
      _userDetails = _$v.userDetails?.toBuilder();
      _userStats = _$v.userStats?.toBuilder();
      _clickStatistics = _$v.clickStatistics?.toBuilder();
      _appInfo = _$v.appInfo?.toBuilder();
      _exceptionMessage = _$v.exceptionMessage;
      _loading = _$v.loading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              initializing: initializing,
              isAuthenticated: isAuthenticated,
              isRegistered: isRegistered,
              isLocked: isLocked,
              isSetupCompleted: isSetupCompleted,
              playSounds: playSounds,
              showNotifications: showNotifications,
              userDetails: _userDetails?.build(),
              userStats: _userStats?.build(),
              clickStatistics: _clickStatistics?.build(),
              appInfo: _appInfo?.build(),
              exceptionMessage: exceptionMessage,
              loading: loading);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'userDetails';
        _userDetails?.build();
        _$failedField = 'userStats';
        _userStats?.build();
        _$failedField = 'clickStatistics';
        _clickStatistics?.build();
        _$failedField = 'appInfo';
        _appInfo?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
