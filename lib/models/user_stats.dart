import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mindwatch/models/serializers.dart';

part 'user_stats.g.dart';

abstract class UserStats implements Built<UserStats, UserStatsBuilder> {
  factory UserStats([void Function(UserStatsBuilder) updates]) = _$UserStats;

  UserStats._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(UserStats.serializer, this)
        as Map<String, dynamic>;
  }

  static UserStats fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(UserStats.serializer, json);
  }

  @BuiltValueSerializer(serializeNulls: true)
  static Serializer<UserStats> get serializer => _$userStatsSerializer;

  bool get success;

  Statistics get today;

  Statistics get yesterday;

  Statistics get overall;

  @nullable
  @BuiltValue(wireName: 'bluetooth_clicks')
  int get bluetoothClicks;
}

abstract class Statistics implements Built<Statistics, StatisticsBuilder> {
  factory Statistics([void Function(StatisticsBuilder) updates]) = _$Statistics;

  Statistics._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Statistics.serializer, this)
        as Map<String, dynamic>;
  }

  static Statistics fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Statistics.serializer, json);
  }

  @BuiltValueSerializer(serializeNulls: true)
  static Serializer<Statistics> get serializer => _$statisticsSerializer;

  @BuiltValueField(wireName: 'button_clicks')
  BuiltList<ButtonClickData> get buttonClickData;

  @BuiltValueField(wireName: 'cause_clicks')
  BuiltList<CauseClickData> get causeClickData;

  @nullable
  int get total;
}

abstract class ButtonClickData
    implements Built<ButtonClickData, ButtonClickDataBuilder> {
  factory ButtonClickData([void Function(ButtonClickDataBuilder) updates]) =
      _$ButtonClickData;

  ButtonClickData._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ButtonClickData.serializer, this)
        as Map<String, dynamic>;
  }

  static ButtonClickData fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ButtonClickData.serializer, json);
  }

  static Serializer<ButtonClickData> get serializer =>
      _$buttonClickDataSerializer;

  String get button;

  String get total;
}

abstract class CauseClickData
    implements Built<CauseClickData, CauseClickDataBuilder> {
  factory CauseClickData([void Function(CauseClickDataBuilder) updates]) =
      _$CauseClickData;

  CauseClickData._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(CauseClickData.serializer, this)
        as Map<String, dynamic>;
  }

  static CauseClickData fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(CauseClickData.serializer, json);
  }

  static Serializer<CauseClickData> get serializer =>
      _$causeClickDataSerializer;

  String get cause;

  String get total;
}
