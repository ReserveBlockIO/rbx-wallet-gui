import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rbx_wallet/features/transactions/models/transaction.dart';

part 'block.freezed.dart';
part 'block.g.dart';

@freezed
class Block with _$Block {
  const Block._();

  factory Block({
    @JsonKey(name: "Height") required int height,
    @JsonKey(name: "Timestamp") required int timestamp,
    @JsonKey(name: "Hash") required String hash,
    @JsonKey(name: "Validator") required String validator,
    @JsonKey(name: "NextValidators") required String nextValidators,
    @JsonKey(name: "TotalAmount") required double totalAmount,
    @JsonKey(name: "TotalReward") required double totalReward,
    @JsonKey(name: "NumOfTx") required int numberOfTransactions,
    @JsonKey(name: "Size") required int size,
    @JsonKey(name: "BCraftTime") required int craftTime,
    @JsonKey(name: "Transactions") required List<Transaction> transactions,
  }) = _Block;

  factory Block.fromJson(Map<String, dynamic> json) => _$BlockFromJson(json);

  List<String> get nextValidatorsList {
    if (nextValidators.isEmpty) {
      return [];
    }
    return nextValidators.split(":");
  }

  String? get nextValidator {
    if (nextValidatorsList.isEmpty) {
      return null;
    }

    return nextValidatorsList.first;
  }
}
