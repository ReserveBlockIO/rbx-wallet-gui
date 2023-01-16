import 'package:freezed_annotation/freezed_annotation.dart';

import '../transactions/models/transaction.dart';

part 'block.freezed.dart';
part 'block.g.dart';

@freezed
class Block with _$Block {
  const Block._();

  factory Block({
    @JsonKey(name: "Height") required int height,
    @JsonKey(name: "ChainRefId") required String chainRefId,
    @JsonKey(name: "Timestamp") required int timestamp,
    @JsonKey(name: "Hash") required String hash,
    @JsonKey(name: "PrevHash") required String prevHash,
    @JsonKey(name: "MerkleRoot") required String merkleRoot,
    @JsonKey(name: "StateRoot") required String stateRoot,
    @JsonKey(name: "Validator") required String validator,
    @JsonKey(name: "ValidatorSignature") required String validatorSignature,
    @JsonKey(name: "ValidatorAnswer") required String validatorAnswer,
    @JsonKey(name: "TotalValidators") required int totalValidators,
    @JsonKey(name: "Version") required int version,
    @JsonKey(name: "TotalAmount") required double totalAmount,
    @JsonKey(name: "TotalReward") required double totalReward,
    @JsonKey(name: "NumOfTx") required int numberOfTransactions,
    @JsonKey(name: "Size") required int size,
    @JsonKey(name: "BCraftTime") required int craftTime,
    @JsonKey(name: "Transactions") required List<Transaction> transactions,
  }) = _Block;

  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);
}
