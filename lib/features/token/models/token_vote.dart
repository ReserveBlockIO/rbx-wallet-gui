import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_vote.freezed.dart';
part 'token_vote.g.dart';

enum TokenVoteType {
  No,
  Yes,
}

voteTypeFromJson(int value) {
  return value == 1 ? TokenVoteType.Yes : TokenVoteType.No;
}

@freezed
class TokenVote with _$TokenVote {
  const TokenVote._();

  const factory TokenVote({
    @JsonKey(name: "Id") required int id,
    @JsonKey(name: "SmartContractUID") required String smartContractUid,
    @JsonKey(name: "TopicUID") required String topicUid,
    @JsonKey(name: "Address") required String address,
    @JsonKey(name: "VoteType", fromJson: voteTypeFromJson) required TokenVoteType voteType,
    @JsonKey(name: "TransactionHash") required String transactionHash,
    @JsonKey(name: "BlockHeight") required int blockHeight,
  }) = _TokenVote;

  factory TokenVote.fromJson(Map<String, dynamic> json) => _$TokenVoteFromJson(json);
  String get voteTypeLabel {
    return voteType == TokenVoteType.Yes ? "YES" : "NO";
  }
}
