import 'package:freezed_annotation/freezed_annotation.dart';

part 'node_info.freezed.dart';
part 'node_info.g.dart';

@freezed
class NodeInfo with _$NodeInfo {
  const NodeInfo._();

  factory NodeInfo({
    @JsonKey(name: 'NodeIP') required String ip,
    @JsonKey(name: 'NodeHeight') required int height,
    @JsonKey(name: 'NodeLatency') required int latency,
    @JsonKey(name: 'NodeLastChecked') DateTime? lastCheked,
  }) = _NodeInfo;

  factory NodeInfo.fromJson(Map<String, dynamic> json) =>
      _$NodeInfoFromJson(json);
}
