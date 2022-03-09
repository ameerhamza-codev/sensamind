import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mindwatch/models/serializers.dart';

part 'click_data.g.dart';

abstract class ClickDataList
    implements Built<ClickDataList, ClickDataListBuilder> {
  factory ClickDataList([void Function(ClickDataListBuilder) updates]) =
      _$ClickDataList;

  ClickDataList._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ClickDataList.serializer, this)
        as Map<String, dynamic>;
  }

  static ClickDataList fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ClickDataList.serializer, json);
  }

  @BuiltValueSerializer(serializeNulls: true)
  static Serializer<ClickDataList> get serializer => _$clickDataListSerializer;

  @BuiltValueField()
  @nullable
  BuiltList<ClickData> get clickDataList;
}

abstract class ClickData implements Built<ClickData, ClickDataBuilder> {
  factory ClickData([void Function(ClickDataBuilder) updates]) = _$ClickData;

  ClickData._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ClickData.serializer, this)
        as Map<String, dynamic>;
  }

  static ClickData fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(ClickData.serializer, json);
  }

  @BuiltValueSerializer(serializeNulls: true)
  static Serializer<ClickData> get serializer => _$clickDataSerializer;

  @BuiltValueField(wireName: 'button')
  @nullable
  String get button;

  @BuiltValueField(wireName: 'button_id')
  @nullable
  String get buttonId;

  @BuiltValueField(wireName: 'cause')
  @nullable
  String get cause;

  @BuiltValueField(wireName: 'clicked_at')
  @nullable
  String get clickedAt;

  @BuiltValueField(wireName: 'click_unsent')
  @nullable
  bool get clickUnsent;
}
