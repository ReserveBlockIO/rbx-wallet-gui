import 'package:freezed_annotation/freezed_annotation.dart';

part 'node.freezed.dart';
part 'node.g.dart';

@freezed
class Node with _$Node {
  const Node._();

  factory Node({
    @JsonKey(name: 'Id') required int id,
    @JsonKey(name: 'Address') required String address,
    @JsonKey(name: 'UniqueName') required String uniqueName,
    @JsonKey(name: 'Position') required int position,
    @JsonKey(name: 'Amount') required double amount,
    @JsonKey(name: 'Signature') required String signature,
    @JsonKey(name: 'IsActive') required bool isActive,
    @JsonKey(name: 'FailCount') required int failCount,
    @JsonKey(name: 'NodeIP') required String nodeIp,
    @JsonKey(name: 'NodeReferenceId') required String nodeReferenceId,
  }) = _Node;

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}
