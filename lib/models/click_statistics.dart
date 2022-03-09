import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mindwatch/models/serializers.dart';

part 'click_statistics.g.dart';

abstract class ClickStatistics
    implements Built<ClickStatistics, ClickStatisticsBuilder> {
  factory ClickStatistics([void Function(ClickStatisticsBuilder) updates]) =
      _$ClickStatistics;
  ClickStatistics._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ClickStatistics.serializer, this)
        as Map<String, dynamic>;
  }

  static ClickStatistics fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ClickStatistics.serializer, json);
  }

  static Serializer<ClickStatistics> get serializer =>
      _$clickStatisticsSerializer;

  @BuiltValue()
  ClickStat get yesterday;

  @BuiltValue()
  ClickStat get today;

  @BuiltValue()
  ClickStat get overall;
}

abstract class ClickStat implements Built<ClickStat, ClickStatBuilder> {
  factory ClickStat([void Function(ClickStatBuilder) updates]) = _$ClickStat;

  ClickStat._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ClickStat.serializer, this)
        as Map<String, dynamic>;
  }

  static ClickStat fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ClickStat.serializer, json);
  }

  static Serializer<ClickStat> get serializer => _$clickStatSerializer;

  @BuiltValueField()
  String get mostClickedButton;

  @BuiltValueField()
  String get mostClickedCause;

  @BuiltValueField()
  String get percentage;

  @BuiltValueField()
  @nullable
  String get totalClicks;
}
