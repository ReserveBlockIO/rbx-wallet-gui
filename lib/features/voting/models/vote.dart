import 'package:freezed_annotation/freezed_annotation.dart';

part 'vote.freezed.dart';
part 'vote.g.dart';

enum VoteType {
  No,
  Yes,
}

voteTypeFromJson(int value) {
  return value == 1 ? VoteType.Yes : VoteType.No;
}

@freezed
class Vote with _$Vote {
  const Vote._();

  factory Vote({
    @JsonKey(name: "Id") required int id,
    @JsonKey(name: "TopicUID") required String uid,
    @JsonKey(name: "Address") required String address,
    @JsonKey(name: "VoteType", fromJson: voteTypeFromJson) required VoteType type,
    @JsonKey(name: "TransactionHash") required String transactionHash,
    @JsonKey(name: "BlockHeight") required int blockHeight,
  }) = _Vote;

  factory Vote.fromJson(Map<String, dynamic> json) => _$VoteFromJson(json);
}
