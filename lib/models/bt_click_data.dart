import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:mindwatch/models/serializers.dart';

part 'bt_click_data.g.dart';

abstract class BtClickData implements Built<BtClickData, BtClickDataBuilder> {
  factory BtClickData([void Function(BtClickDataBuilder) updates]) =
      _$BtClickData;

  BtClickData._();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(BtClickData.serializer, this)
        as Map<String, dynamic>;
  }

  static BtClickData fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(BtClickData.serializer, json);
  }

  static Serializer<BtClickData> get serializer => _$btClickDataSerializer;

//  @BuiltValueField(wireName: 'current_set')
//  int get currentSet;

  int get button;

  @BuiltValueField(wireName: 'clicked_at')
  DateTime get clickedAt;
}
